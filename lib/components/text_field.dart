import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsecureText;
  final  suffixicon;
  const MyTextField({Key? key, this.suffixicon, this.controller, required this.hintText, required this.obsecureText,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
          ),
          fillColor: Colors.grey.shade100,
          filled:true,
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(color: Colors.black,),
          labelStyle: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w500),
          contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
          suffixIcon: suffixicon,
        ),
      ),
    );
  }
}
