import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'login_screen.dart';

class ContactsScreen extends StatefulWidget {

  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  // void sendSms() async {
  //   List<String> recipients = ['1234567890', '0987654321']; // Replace with the phone numbers you want to send the message to
  //   String message = 'This is a test message'; // Replace with the message you want to send
  //   String result = await sendSMS(message: message, recipients: recipients)
  //       .catchError((onError) {
  //     print(onError);
  //     return ''; // Return an empty string to satisfy the requirement of catchError method.
  //   });
  //   print(result);
  // }

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
                        sendSms();
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
      body: Column(
        children: [
          Row(
            children: [
              Text("Ahmed Samy"),
              SizedBox(width: 10,),
              GestureDetector(
                  onTap: (){
                   //sendSms();

                  },
                  child: Icon(Icons.message,)),
            ],
          )
        ],
      )
    );
  }
}


