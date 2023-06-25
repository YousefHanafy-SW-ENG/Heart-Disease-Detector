import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_app_finallll/screens/password_screen.dart';
import 'package:page_transition/page_transition.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 37,),
              Padding(
                padding: const EdgeInsets.only(right: 280),
                child: Container(
                  width: 53,
                  height: 53,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: Colors.grey.shade100
                  ),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightWithFade,duration: Duration(milliseconds:600 ), child: PasswordScreen()));
                      },
                      child: Icon(Icons.arrow_left_outlined,color: Colors.black,size: 36,)),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text("What's your gender?",style: GoogleFonts.muli(
                  fontWeight: FontWeight.bold,
                  fontSize: 26
              ),),
              SizedBox(
                height: 10,
              ),
              Text("To give you a better experience we need",style: TextStyle(
              fontSize: 16,
               color: Colors.grey),),
              Text("to know your gender",style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey),),
              SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 350,
                      decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ]
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 6,),
                          Text("Male",style: GoogleFonts.lora(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      width: 150,
                      height: 350,
                      decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 6,),
                          Text("Female",style: GoogleFonts.lora(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
