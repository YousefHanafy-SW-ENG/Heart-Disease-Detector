import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  late double height,width;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: height*.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/doctor1.jpg'),fit: BoxFit.cover,
                    ),
                    //color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(220),
                  ),
                  ),

                ),
                SizedBox(height:47,),
                Text("Your Health",style: GoogleFonts.montserrat(
                  color: Colors.blue[900],
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),),
                //SizedBox(height: 1,),
                Stack(
                  children:[
                    // Stroked text as border.
                    Text(
                      'Our Care',
                      style: GoogleFonts.montserrat(
                        fontSize: 50,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.blue[900]!,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'Our Care',
                      style: GoogleFonts.montserrat(
                        fontSize: 50,
                        color: Colors.grey[300],
                      ),
                    ),

                  ],

                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
