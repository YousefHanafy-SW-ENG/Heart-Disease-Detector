import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fancy_button_flutter/fancy_button_flutter.dart';
import 'package:heart_app_finallll/screens/settings_screen.dart';

import '../components/my_button.dart';
import 'emergency_contacts.dart';
import 'help_center.dart';
import 'my_account.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Profile",style: GoogleFonts.montserrat(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.w400,
            fontSize: 29
          ),),
        ),
       // leading: Icon(Icons.arrow_back_ios,color: Colors.grey[800],),
        //leading: Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
            SizedBox(height: 15,),
            SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("lib/images/gamed.png",),
                ),
                Positioned(
                    bottom: 0,
                    right: -29,
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 0,
                      fillColor: Color(0xFFF5F6F9),
                      child: Icon(Icons.camera_alt, color: Colors.black87,size: 25,),
                      padding: EdgeInsets.all(7.5),
                      shape: CircleBorder(),
                    )),
              ],
            ),
          ),
            SizedBox(height: 23,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyAccount();
                }));
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 1.5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white,width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: Colors.grey.shade100,
                        filled:true,
                        hintStyle: GoogleFonts.montserrat(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                        prefixIcon: Icon(Icons.person,color: Colors.blue.shade900,),
                        suffixIcon: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return MyAccount();
                              }));
                            },
                            child: Icon(Icons.arrow_forward_ios,color: Colors.blue.shade900,size: 28,)),
                        hintText: "My Account",
                      ),
                    ),
                  ),
                ),
            ),
            SizedBox(height: 23,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 1.5),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.grey.shade100,
                    filled:true,
                    hintStyle: GoogleFonts.montserrat(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.phone,color: Colors.blue.shade900,),
                    suffixIcon: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return EmergencyContacts();
                          }));
                        },
                        child: Icon(Icons.arrow_forward_ios,color: Colors.blue.shade900,size: 28,)),
                    hintText: "Emergency Contacts",
                  ),
                ),
              ),
            SizedBox(height: 23,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 1.5),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.grey.shade100,
                    filled:true,
                    hintStyle: GoogleFonts.montserrat(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.settings,color: Colors.blue.shade900,),
                    suffixIcon: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return SettingsScreen();
                          }));
                        },
                        child: Icon(Icons.arrow_forward_ios,color: Colors.blue.shade900,size: 28,)),
                    hintText: "Settings",
                  ),
                ),
              ),
            SizedBox(height: 23,),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 1.5),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.grey.shade100,
                    filled:true,
                    hintStyle: GoogleFonts.montserrat(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.help,color: Colors.blue.shade900,),
                    suffixIcon: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return HelpCenter();
                          }));
                        },
                        child: Icon(Icons.arrow_forward_ios,color: Colors.blue.shade900,size: 28,)),
                    hintText: "Help Center",
                  ),
                ),
              ),
            SizedBox(height:18,),
            MyButtonLogout(
                onTap: (){},
                text: "Logout"
            ),
            ],
          ),
        ),
      ),
    );
  }
}
