// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:ManagerCreatePassword() ,
));

class ManagerCreatePassword extends StatelessWidget {
  const ManagerCreatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("FORMULA 1 HOSTEL BOOKING",
            style: TextStyle(
                fontSize: 16
            ),),
          elevation: 10.0,
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(80, 60, 80, 0),
                        child:Center(
                          child: Icon(Icons.privacy_tip_outlined,
                            color: Colors.white,
                            size: 100.0,),
                        ),
                      ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 80),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25),
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.elliptical(100, 100), topLeft: Radius.elliptical(100, 100)),
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(
            "Create New Password",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 30
            ),
          ),
        ])
        ),

                    ]),
              ]),
        )
    );
  }
}