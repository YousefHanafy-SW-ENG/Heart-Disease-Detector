import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_app_finallll/screens/password_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../components/my_button.dart';
import '../components/square_title.dart';
import '../components/text_field.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  void signUserUp(){
    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade,duration: Duration(milliseconds:600 ), child: PasswordScreen()));
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
                        Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(milliseconds:550 ), child: LoginScreen()));

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
                padding: const EdgeInsets.only(right: 155),
                child: Text("Registration",style: GoogleFonts.lora(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
              ),
              SizedBox(height: 9,),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text("Please enter your email and mobile number",style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey),),
              ),
              SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.only(right:85 ),
                child: Text("then we will send OTP to verify",style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey),),
              ),
              SizedBox(height: 14,),
              MyTextField(
                controller: phoneController,
                hintText: "Phone Number",
                obsecureText: false,
              ),
              SizedBox(height: 6,),
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obsecureText: false,
              ),
              SizedBox(height: 6,),
              MyTextField(
                controller: usernameController,
                hintText: "Full Name",
                obsecureText: false,
              ),
              SizedBox(height: 17,),
              MyButton(
                onTap:signUserUp ,
                text: "Proceed",
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an Account Already?",style: GoogleFonts.montserrat(
                      color: Colors.grey[800],
                    fontSize: 15
                  ),),
                  SizedBox(width:4 ,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(milliseconds:550 ), child: LoginScreen()));
                    },
                    child: Text("Login",
                      style: GoogleFonts.montserrat(
                          color: Colors.blueAccent[400],fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Or Sign Up with",
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[800],
                      ),),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:13 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTitle(imagePath: 'lib/images/google.png',text: "Google",),
                  SizedBox(width:5 ,),
                  SquareTitle(imagePath: 'lib/images/facebook.png',text: "Facebook",)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
