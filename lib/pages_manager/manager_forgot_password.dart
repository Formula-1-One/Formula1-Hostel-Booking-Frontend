// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/manager_password_verification.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/login.dart';



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
        padding: EdgeInsets.fromLTRB(80, 60, 80, 0),
        child:Center(
          child: Icon(Icons.password_rounded,
                        color: Colors.white,
                         size: 100.0,),
        ),
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
              TextField(
                decoration: InputDecoration(
                    hintText: 'E-mail'
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 45,vertical: 10)
                  ),
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => ManagerPasswordVerification()));
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Remember Password?" ,
                    style: TextStyle(fontSize: 18),

                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ManagerLoginPage()));
                  },
                    child: Text("Log in",
                      style: TextStyle(fontSize: 15,
                      color: Colors.deepPurpleAccent),
                    ),)
                ],
              ),
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

