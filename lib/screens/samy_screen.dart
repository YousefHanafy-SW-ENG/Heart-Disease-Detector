import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:http/http.dart' as http;
import 'login_screen.dart';

void main() {
  runApp(MaterialApp(home: BluetoothConnectionScreen()));
}

class BluetoothConnectionScreen extends StatefulWidget {
  @override
  _BluetoothConnectionScreenState createState() =>
      _BluetoothConnectionScreenState();
}

class _BluetoothConnectionScreenState extends State<BluetoothConnectionScreen> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  List<BluetoothDevice> _devicesList = [];
  late BluetoothDevice _selectedDevice;
  late BluetoothConnection _connection;

  @override
  void initState() {
    super.initState();
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    _getPairedDevices();
  }

  Future<void> _getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    try {
      devices = await FlutterBluetoothSerial.instance.getBondedDevices();
    } on PlatformException {
      print("Error getting paired devices.");
    }

    setState(() {
      _devicesList = devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bluetooth Connection',style: GoogleFonts.montserrat(),),
      centerTitle: true,
        backgroundColor: Colors.blueAccent[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 18,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.push(context, Dashboard(device: _selectedDevice, connection: _connection) as Route<Object?>);
                  });
                },
                  child: Text('Paired Devices',style: TextStyle(fontSize: 20),)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _devicesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_devicesList[index].name.toString()),
                    onTap: () async {
                      print('Attempting to connect to ${_devicesList[index].name}');
                      _selectedDevice = _devicesList[index];
                      await _connectToDevice(_selectedDevice);
                      if (_connection != null && _connection.isConnected) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(
                              device: _selectedDevice,
                              connection: _connection,
                            ),
                          ),
                        );
                      }
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () async {
                        await _connectToDevice(_devicesList[index]);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    try {
      print('Connecting to ${device.name}...');
      BluetoothConnection connection =
      await BluetoothConnection.toAddress(device.address);
      setState(() {
        _connection = connection;
      });
      print('Connected to ${device.name}');
    } catch (e) {
      print("Error connecting to device: $e");
      // Show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to connect to the device')),
      );
    }
  }
}
class BluetoothDataScreen extends StatefulWidget {
  final BluetoothDevice device;
  final BluetoothConnection connection;
  BluetoothDataScreen({required this.device, required this.connection});
  @override
  _BluetoothDataScreenState createState() => _BluetoothDataScreenState();
}
class _BluetoothDataScreenState extends State<BluetoothDataScreen> {
  String _data = '';
  String _dataBuffer = ''; // Buffer to accumulate received data
  String _result = '';
  double _averageHeartRate = 0;
  late Interpreter _interpreter;
  List<double> _heartRates = [];
  @override
  void initState() {
    super.initState();
    loadModel();
    widget.connection.input?.listen(_onDataReceived).onDone(() {
      print('Disconnected from the device');
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadModel() async {
    try {
      _interpreter =
      await Interpreter.fromAsset('assets/senior_multi_diseases_2.tflite');
      print('Model loaded successfully');
      print('Input shape: ${_interpreter.getInputTensor(0).shape}');
      print('Output shape: ${_interpreter.getOutputTensor(0).shape}');
    } catch (e) {
      print('Failed to load model: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Heart Rate Data')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Heart Rate....: $_data BPM',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Predicted Class: $_result',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Heart Rate:${_averageHeartRate.toStringAsFixed(
                    1)} BPM',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDataReceived(Uint8List data) {
    String receivedData = String.fromCharCodes(data);
    _dataBuffer += receivedData;
    // Check if a complete line of data has been received
    if (_dataBuffer.contains('\n')) {
      List<String> lines = _dataBuffer.split('\n');
      _dataBuffer = lines.removeLast();
      for (String line in lines) {
        try {
          double heartRate = double.parse(line.trim());
          _heartRates.add(heartRate);
          setState(() {
            _data = line;
          });
        } catch (e) {
          print('Error parsing received data: $e');
        }
      }
      if (_heartRates.length >= 187) {
        _processDataAndMakePrediction(_heartRates.sublist(0, 187));
        _heartRates.removeRange(0, 187);
      }
    }
  }
  Future<void> _processDataAndMakePrediction(List<double> heartRates) async {
    try {
      _averageHeartRate = heartRates.reduce((a, b) => a + b) / heartRates.length;
      print("Original heart rates: $heartRates");
      double maxValue = heartRates.reduce((curr, next) => curr > next ? curr : next);
      List<double> normalizedHeartRates = heartRates.map((value) => value / maxValue).toList();
      print("Normalized heart rates: $normalizedHeartRates");
      List<List<List<List<double>>>> inputData = [
        [normalizedHeartRates.map((value) => [value]).toList()]
      ];
      List<List<double>> outputData = List.generate(1, (_) => List.filled(5, 0.0));
      print('Input data: $inputData');
      _interpreter.run(inputData[0], outputData);
      print('Output data: $outputData');
      int predictedIndex = outputData[0].indexWhere((element) =>
      element == outputData[0].reduce((curr, next) => curr > next ? curr : next));
      String outcome = ['N', 'S', 'P', 'F', 'U'][predictedIndex];
      setState(() {
        _result = outcome;
        print(_result);
      });
    } catch (e) {
      print('Error while processing data and making prediction: $e');
    }
  }
}
class Dashboard extends StatefulWidget {
  final BluetoothDevice device;
  final BluetoothConnection connection;
  const Dashboard({Key? key, required this.device, required this.connection}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin{
  String _data = '';
  String _dataBuffer = ''; // Buffer to accumulate received data
  String _result = '';
  double _averageHeartRate = 0;
  late Interpreter _interpreter;
  List<double> _heartRates = [];
  @override
  void initState() {
    super.initState();
    loadModel();
    widget.connection.input?.listen(_onDataReceived).onDone(() {
      print('Disconnected from the device');
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadModel() async {
    try {
      _interpreter =
      await Interpreter.fromAsset('assets/senior_multi_diseases_2.tflite');
      print('Model loaded successfully');
      print('Input shape: ${_interpreter.getInputTensor(0).shape}');
      print('Output shape: ${_interpreter.getOutputTensor(0).shape}');
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _getData();
  // }

  Future _getData() async {
    const url = 'http://192.168.175.129/test/getData.php'; // Replace with your backend URL
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);
    setState(() {
      _result = data[0]['result'];
      // print(_result);// Replace 'result' with the name of the column you want to retrieve
      // print(data);
    });
    //  if(response.statusCode==200){
    //    var data = jsonDecode(response.body);
    //    print(data);
    //  }
    return _result;
  }

  final colorwhite = Colors.white;
  @override
  Widget build(BuildContext context) {
    _getData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5,right: 7),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: Colors.grey.shade100
                  ),
                  child: GestureDetector(
                      onTap: (){
                        //Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(milliseconds:550 ), child: LoginScreen()));

                      },
                      child: Icon(LineAwesomeIcons.bell,color: Colors.black,size: 36,)),),
              ],
            ),
          ),
        ],
        leading:
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              SizedBox(width: 10,),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.grey.shade100
                ),
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(milliseconds:550 ), child: LoginScreen()));

                    },
                    child: Icon(Icons.arrow_left_outlined,color: Colors.black,size: 36,)),),
            ],
          ),
        ),
        leadingWidth: 100,
        title: Text("Home",style: GoogleFonts.lora(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 36
        ),),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                Text("Good morning,",
                  style: GoogleFonts.lora(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                Text("Yousef",
                  style: GoogleFonts.lora(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500
                  ),

                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Color(0xffff6968),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Heart Rate $_data BPM',
                            style: TextStyle(color: colorwhite, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,right: 5),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.38)),
                              child: Icon(
                                Icons.favorite,
                                color: colorwhite,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      )
                      ,Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left:10,bottom: 20),
                          child: Text(_result
                            ,style: TextStyle(
                              fontSize: 27,
                              color: colorwhite,
                            ),
                          )),
                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right:10,bottom: 10),
                          child: Column(
                            children: [
                              Text('Heart Rate:${_averageHeartRate.toStringAsFixed(
                                  1)} BPM'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                              Text('50-120'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                            ],
                          ))

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Color(0xffff6968),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Heart Rate',
                            style: TextStyle(color: colorwhite, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,right: 5),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.38)),
                              child: Icon(
                                Icons.favorite,
                                color: colorwhite,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      )
                      ,Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left:10,bottom: 20),
                          child: Text(_result+"ormal"+"         80"
                            ,style: TextStyle(
                              fontSize: 27,
                              color: colorwhite,
                            ),
                          )),
                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right:10,bottom: 10),
                          child: Column(
                            children: [
                              Text('Healthy'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                              Text('50-120'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                            ],
                          ))

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Color(0xffff6968),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Heart Rate',
                            style: TextStyle(color: colorwhite, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,right: 5),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.38)),
                              child: Icon(
                                Icons.favorite,
                                color: colorwhite,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      )
                      ,Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left:10,bottom: 20),
                          child: Text(_result+"Normal"+"         80"
                            ,style: TextStyle(
                              fontSize: 27,
                              color: colorwhite,
                            ),
                          )),
                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right:10,bottom: 10),
                          child: Column(
                            children: [
                              Text('Healthy'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                              Text('50-120'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                            ],
                          ))

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Color(0xffff6968),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Heart Rate',
                            style: TextStyle(color: colorwhite, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,right: 5),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.38)),
                              child: Icon(
                                Icons.favorite,
                                color: colorwhite,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      )
                      ,Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left:10,bottom: 20),
                          child: Text(_result+"Normal"+"         80"
                            ,style: TextStyle(
                              fontSize: 27,
                              color: colorwhite,
                            ),
                          )),
                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right:10,bottom: 10),
                          child: Column(
                            children: [
                              Text('Healthy'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                              Text('50-120'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                            ],
                          ))

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Color(0xffff6968),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Heart Rate',
                            style: TextStyle(color: colorwhite, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,right: 5),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.38)),
                              child: Icon(
                                Icons.favorite,
                                color: colorwhite,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      )
                      ,Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left:10,bottom: 20),
                          child: Text(_result+"Normal"+"         80"
                            ,style: TextStyle(
                              fontSize: 27,
                              color: colorwhite,
                            ),
                          )),
                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right:10,bottom: 10),
                          child: Column(
                            children: [
                              Text('Healthy'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                              Text('50-120'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                            ],
                          ))

                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Card(
                color: Color(0xffff6968),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Heart Rate',
                            style: TextStyle(color: colorwhite, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5,right: 5),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.38)),
                              child: Icon(
                                Icons.favorite,
                                color: colorwhite,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      )
                      ,Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left:10,bottom: 20),
                          child: Text(_result+"Normal"+"         80"
                            ,style: TextStyle(
                              fontSize: 27,
                              color: colorwhite,
                            ),
                          )),
                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right:10,bottom: 10),
                          child: Column(
                            children: [
                              Text('Healthy'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                              Text('50-120'
                                ,style: TextStyle(
                                    fontSize: 20,
                                    color: colorwhite),
                              ),
                            ],
                          ))

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _onDataReceived(Uint8List data) {
    String receivedData = String.fromCharCodes(data);
    _dataBuffer += receivedData;
    // Check if a complete line of data has been received
    if (_dataBuffer.contains('\n')) {
      List<String> lines = _dataBuffer.split('\n');
      _dataBuffer = lines.removeLast();
      for (String line in lines) {
        try {
          double heartRate = double.parse(line.trim());
          _heartRates.add(heartRate);
          setState(() {
            _data = line;
          });
        } catch (e) {
          print('Error parsing received data: $e');
        }
      }
      if (_heartRates.length >= 187) {
        _processDataAndMakePrediction(_heartRates.sublist(0, 187));
        _heartRates.removeRange(0, 187);
      }
    }
  }
  Future<void> _processDataAndMakePrediction(List<double> heartRates) async {
    try {
      _averageHeartRate = heartRates.reduce((a, b) => a + b) / heartRates.length;
      print("Original heart rates: $heartRates");
      double maxValue = heartRates.reduce((curr, next) => curr > next ? curr : next);
      List<double> normalizedHeartRates = heartRates.map((value) => value / maxValue).toList();
      print("Normalized heart rates: $normalizedHeartRates");
      List<List<List<List<double>>>> inputData = [
        [normalizedHeartRates.map((value) => [value]).toList()]
      ];
      List<List<double>> outputData = List.generate(1, (_) => List.filled(5, 0.0));
      print('Input data: $inputData');
      _interpreter.run(inputData[0], outputData);
      print('Output data: $outputData');
      int predictedIndex = outputData[0].indexWhere((element) =>
      element == outputData[0].reduce((curr, next) => curr > next ? curr : next));
      String outcome = ['N', 'S', 'P', 'F', 'U'][predictedIndex];
      setState(() {
        _result = outcome;
        print(_result);
      });
    } catch (e) {
      print('Error while processing data and making prediction: $e');
    }
  }
}
