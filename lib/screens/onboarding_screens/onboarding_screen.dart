import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login_screen.dart';
import 'intro_page_1.dart';
import 'intro_page_2.dart';
import 'intro_page_3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: [
         PageView(
           controller: _controller,
           onPageChanged: (index){
             setState(() {
               onLastPage = (index == 2);
             });
           },
           children: [
             IntroPage1(),
             IntroPage2(),
             IntroPage3(),
           ],
         ),
         Container(
           alignment: Alignment(0,0.75),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 GestureDetector(
                     onTap: (){
                      _controller.jumpToPage(2);

                     },
                     child: Text("Skip",
                       style: TextStyle(
                         fontFamily: 'Montserrat',
                           fontSize: 17,
                           fontWeight: FontWeight.bold,
                           color: Colors.blue[900]
                       ),)),

                 SmoothPageIndicator(controller: _controller, count: 3,effect: ExpandingDotsEffect(dotColor: Colors.blue.shade900,
                 activeDotColor:Colors.blue.shade900),),
                 onLastPage ?
                 GestureDetector(
                     onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoginScreen();
                      }));
                     },
                     child: Text("Done",
                         style: TextStyle(
                         fontSize: 17,
                         fontWeight: FontWeight.bold,
                           color: Colors.blue[900],
                     ),)):
                 GestureDetector(
                     onTap: (){
                       _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                     },
                     child: Text("Next",
                     style: TextStyle(
                         fontSize: 17,
                         fontWeight: FontWeight.bold,
                       color: Colors.blue[900]
                     ),)),
               ],
             ))
       ],
     ),
    );
  }
}
