import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyContacts extends StatefulWidget {
  const EmergencyContacts({Key? key}) : super(key: key);

  @override
  State<EmergencyContacts> createState() => _EmergencyContactsState();
}

class _EmergencyContactsState extends State<EmergencyContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "Emergency Contacts",
          style: GoogleFonts.montserrat(
          ),
        ),
      ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children:  [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Text('Ahmed Samy',style: GoogleFonts.montserrat(
                  color: Colors.black,fontWeight: FontWeight.w400
                ),),
                subtitle: Text('01011121314',style: TextStyle(
                  color: Colors.grey.shade700
                ),),
                trailing: Icon(Icons.message,color: Colors.blue.shade900,size: 28,),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[500],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Text('Ahmed Samy',style: GoogleFonts.montserrat(
                    color: Colors.black,fontWeight: FontWeight.w400
                ),),
                subtitle: Text('01011121314',style: TextStyle(
                    color: Colors.grey.shade700
                ),),
                trailing: Icon(Icons.message,color: Colors.blue.shade900,size: 28,),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[500],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Text('Ahmed Samy',style: GoogleFonts.montserrat(
                    color: Colors.black,fontWeight: FontWeight.w400
                ),),
                subtitle: Text('01011121314',style: TextStyle(
                    color: Colors.grey.shade700
                ),),
                trailing: Icon(Icons.message,color: Colors.blue.shade900,size: 28,),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[500],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Text('Ahmed Samy',style: GoogleFonts.montserrat(
                    color: Colors.black,fontWeight: FontWeight.w400
                ),),
                subtitle: Text('01011121314',style: TextStyle(
                    color: Colors.grey.shade700
                ),),
                trailing: Icon(Icons.message,color: Colors.blue.shade900,size: 28,),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[500],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Text('Ahmed Samy',style: GoogleFonts.montserrat(
                    color: Colors.black,fontWeight: FontWeight.w400
                ),),
                subtitle: Text('01011121314',style: TextStyle(
                    color: Colors.grey.shade700
                ),),
                trailing: Icon(Icons.message,color: Colors.blue.shade900,size: 28,),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[500],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Text('Ahmed Samy',style: GoogleFonts.montserrat(
                    color: Colors.black,fontWeight: FontWeight.w400
                ),),
                subtitle: Text('01011121314',style: TextStyle(
                    color: Colors.grey.shade700
                ),),
                trailing: Icon(Icons.message,color: Colors.blue.shade900,size: 28,),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[500],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Text('Ahmed Samy',style: GoogleFonts.montserrat(
                    color: Colors.black,fontWeight: FontWeight.w400
                ),),
                subtitle: Text('01011121314',style: TextStyle(
                    color: Colors.grey.shade700
                ),),
                trailing: Icon(Icons.message,color: Colors.blue.shade900,size: 28,),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[500],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Text('Ahmed Samy',style: GoogleFonts.montserrat(
                    color: Colors.black,fontWeight: FontWeight.w400
                ),),
                subtitle: Text('01011121314',style: TextStyle(
                    color: Colors.grey.shade700
                ),),
                trailing: Icon(Icons.message,color: Colors.blue.shade900,size: 28,),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[500],
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Text('Ahmed Samy',style: GoogleFonts.montserrat(
                    color: Colors.black,fontWeight: FontWeight.w400
                ),),
                subtitle: Text('01011121314',style: TextStyle(
                    color: Colors.grey.shade700
                ),),
                trailing: Icon(Icons.message,color: Colors.blue.shade900,size: 28,),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[500],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
