import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareTitle extends StatelessWidget {
  final String imagePath;
  final String text;
  const SquareTitle({Key? key, required this.imagePath, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 50,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(16),
      color: Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,
            height: 20,
          ),
          SizedBox(width: 6,),
          Text(text,style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 15
          ),),
        ],
      ),
    );
  }
}
