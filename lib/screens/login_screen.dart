import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heart_app_finallll/screens/signup_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../components/my_button.dart';
import '../components/square_title.dart';
import '../components/text_field.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void signUserIn(){

    Navigator.push(context, PageTransition(type: PageTransitionType.fade,duration: Duration(milliseconds:530 ), child: HomePage()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 8,),
                Icon(Icons.heart_broken,
                     size: 50,
                  color: Colors.blueAccent[400],
                ),
                SizedBox(height: 40,),
                Text("Welcome",
                style: GoogleFonts.lora(
                  color: Colors.blueAccent[400],
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text("to CareMe!",
                  style: GoogleFonts.lora(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 67,),
                MyTextField(
                controller: emailController,
                hintText: "Email",
                obsecureText: false,
                ),
                SizedBox(height: 6,),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obsecureText: true,
                  suffixicon: Icon(Icons.remove_red_eye,color: Colors.black,),
                ),
                SizedBox(height: 7,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password?",
                      style: GoogleFonts.montserrat(
                        color: Colors.blueAccent[400],
                        fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 48,),
                MyButton(
                  text: "Log in",
                  onTap:signUserIn ,
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: GoogleFonts.montserrat(
                        color: Colors.black
                    ),),
                    SizedBox(width:4 ,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop,duration: Duration(milliseconds:600 ), child: SignupScreen()));

                      },
                      child: Text("Sign Up",
                        style: GoogleFonts.montserrat(
                            color: Colors.blueAccent[400],fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36,),
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
                        child: Text("Or continue with",style: GoogleFonts.montserrat(
                          color: Colors.black
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
                SizedBox(height:15 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   SquareTitle(imagePath: 'lib/images/google.png',text: "Google",),
                    SizedBox(width:5 ,),
                   SquareTitle(imagePath: 'lib/images/facebook.png',text: "Facebook",),
                  ],
                ),
                SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
