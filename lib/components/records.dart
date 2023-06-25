import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import '../Screens/login_screen.dart';
import 'card_widget.dart';

// ignore: camel_case_types
class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with SingleTickerProviderStateMixin {
  final colorstheme = Color(0xff4b4b87);

  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]),
              child: TabBar(
                  isScrollable: true,
                  indicatorPadding: EdgeInsets.all(10),
                  labelColor: Colors.white,
                  unselectedLabelColor: colorstheme,
                  labelStyle: TextStyle(fontSize: 20),
                  labelPadding:
                  EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                  indicator: BoxDecoration(
                      color: colorstheme,
                      borderRadius: BorderRadius.circular(20)),
                  controller: _tabController,
                  tabs: [
                    Text('Day'),
                    Text('Week'),
                    Text('Month'),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController, children: [
                CardWidget(),
                CardWidget(),
                CardWidget(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}