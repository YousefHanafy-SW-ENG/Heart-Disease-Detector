import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text("My Account",style: GoogleFonts.montserrat(
          fontSize: 22
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  ClipPath(
                    clipper:CustomShape(),
                    child: Container(
                      height: 150,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 8,
                            ),
                            image:DecorationImage(
                              fit: BoxFit.cover,
                              image:AssetImage("lib/images/gamed.png"),
                          )),
                        ),
                        Text("Yousef Hanafy",style:GoogleFonts.montserrat(
                          fontSize: 22,
                        ),),
                        SizedBox(
                          height: 5,
                        ),
                        Text("yousef.hanafy@gmail.com",style:GoogleFonts.montserrat(fontWeight:FontWeight.w400,color:Color(0xFF8492A2),  ),),
                        SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: Colors.grey,
                                    tiles: [
                                      ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        leading: Icon(Icons.my_location,color: Colors.black,),
                                        title: Text("Location",style: GoogleFonts.montserrat(
                                              color: Colors.black,fontWeight: FontWeight.w400
                                        ),),
                                        subtitle: Text("Masr om eldonia",style: GoogleFonts.montserrat(
                                          color: Colors.grey.shade700
                                        ),),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.email,color: Colors.black,),
                                        title: Text("Email",style: GoogleFonts.montserrat(
                                          color: Colors.black,fontWeight: FontWeight.w400
                                        ),),
                                        subtitle: Text("donaldtrump@gmail.com",style: GoogleFonts.montserrat(
                                          color: Colors.grey.shade700
                                        ),),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.phone,color: Colors.black,),
                                        title: Text("Phone",style: GoogleFonts.montserrat(
                                          color: Colors.black,fontWeight: FontWeight.w400
                                        ),),
                                        subtitle: Text("01017582515",style: GoogleFonts.montserrat(
                                          color: Colors.grey.shade700
                                        ),),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.person,color: Colors.black,),
                                        title: Text("Name",style: GoogleFonts.montserrat(
                                          color: Colors.black,fontWeight: FontWeight.w400
                                        ),),
                                        subtitle: Text(
                                            "Yousef Hanafy",style: GoogleFonts.montserrat(
                                          color: Colors.grey.shade700
                                        ),),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                      ]
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CustomShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width  = size.width;
    path.lineTo(0, height-100);
    path.quadraticBezierTo(width/2, height, width, height-100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
       return true;
  }
  
}