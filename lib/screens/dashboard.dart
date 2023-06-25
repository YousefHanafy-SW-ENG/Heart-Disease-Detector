import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'login_screen.dart';
import 'package:http/http.dart' as http;
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin{
  String _result = '';

  @override
  void initState() {
    super.initState();
    _getData();
  }

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
}
