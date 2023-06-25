import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_app_finallll/screens/signup_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../components/my_button.dart';
import '../components/square_title.dart';
import '../components/text_field.dart';
import 'gender_screen.dart';
import 'login_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  void signUserIn(){
    Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(milliseconds:550 ), child: GenderScreen()));
  }
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
                        Navigator.push(context, PageTransition(type: PageTransitionType.leftToRightWithFade,duration: Duration(milliseconds:600 ), child: SignupScreen()));

                      },
                      child: Icon(Icons.arrow_left_outlined,color: Colors.black,size: 36,)),
                ),
              ),
              SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.only(right: 226),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade100,
                  radius: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.purple[100],
                    ),

                    child: Icon(
                      Icons.person,
                      color:Colors.blueAccent[400],
                      size: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(right: 90),
                child: Text("Set your password",style: GoogleFonts.lora(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
              ),
              SizedBox(height: 9,),
              Padding(
                padding: const EdgeInsets.only(right:76 ),
                child: Text("Please enter your new password.",style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey),),
              ),
              SizedBox(height: 20,),
              MyTextField(
                controller: passwordController,
                hintText: "New Password",
                obsecureText: false,
                suffixicon: Icon(Icons.remove_red_eye,color: Colors.black,),
              ),
              SizedBox(height: 6,),
              MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm your new password",
                obsecureText: false,
                suffixicon: Icon(Icons.remove_red_eye,color: Colors.black,),
              ),
              SizedBox(height: 18,),
              FlutterPwValidator(
                  controller: passwordController,
                  width: 290,
                  failureColor: Colors.red,
                  height: 100,
                  minLength: 8,
                  defaultColor: Colors.grey.shade500,
                  uppercaseCharCount: 1,
                  specialCharCount: 1,
                  numericCharCount: 1,
                  successColor: Colors.green,
                  onSuccess: (){
                    print("Password Matched");
                  },
              ),
              SizedBox(height: 121,),
              MyButton(
                onTap:signUserIn ,
                text: "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
