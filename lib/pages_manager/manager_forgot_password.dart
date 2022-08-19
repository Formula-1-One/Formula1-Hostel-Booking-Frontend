// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:ManagerForgotPassword() ,
));

class ManagerForgotPassword extends StatelessWidget {
  const ManagerForgotPassword({Key? key}) : super(key: key);

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
        padding: EdgeInsets.fromLTRB(80, 35, 40, 0),
        child:Text(
          "MANAGER'S PAGE",
          style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ) ,
      ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 35,vertical: 40),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
            width: double.infinity,
            height: 550,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.elliptical(100, 100), topLeft: Radius.elliptical(100, 100)),
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(
            "Forgot Password?",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35
            ),
          ),
              SizedBox(height: 40,),
              Text(
                  'Enter the email address associated with your account.',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
              ),
              ),
              SizedBox(height: 15,),
              Text('We will email you a verification code to check your authenticity.',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40,),

            ]
          )
        ),
        ]
        ),
        ]
        ),
      ),
    );
  }
}

