// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/manager_create_password.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/login.dart';
import 'package:email_auth/email_auth.dart';





void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:ManagerForgotPassword() ,
));

class ManagerForgotPassword extends StatefulWidget {
  const ManagerForgotPassword({Key? key}) : super(key: key);

  @override
  State<ManagerForgotPassword> createState() => _ManagerForgotPasswordState();
}

class _ManagerForgotPasswordState extends State<ManagerForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  EmailAuth emailAuth = EmailAuth(sessionName: "Enter this verification code");

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void sendOtp() async {
    var res = await emailAuth.sendOtp(recipientMail: _emailController.text);
    if(res){
      print("OTP sent");
    }
    else{
      print("we could not send OTP");
    }
  }

  void verifyOtp() {
    var res = emailAuth.validateOtp(
        recipientMail: _emailController.text, userOtp: _otpController.text);
    if (res) {
      print("OTP verified");
      setState(() {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePasswordPage()));
      });
    }
    else {
      print("Invalid OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
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
            height: 650,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.elliptical(50, 50), topLeft: Radius.elliptical(50, 50)),
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
              SizedBox(height: 10,),
              Text('We will email you a verification code to check your authenticity.',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                   SafeArea(
                     child: Column(
                       children: [
                         TextFormField(
                           controller: _emailController,
                           keyboardType: TextInputType.emailAddress,
                           decoration: InputDecoration(
                             prefixIcon: Icon(Icons.email_outlined),
                             suffixIcon: TextButton(
                               child: const Text('Send'),
                               onPressed: ()=> sendOtp(),
                             ),
                             labelText: 'E-mail',
                             hintText: 'Please enter your e-mail'
                           ),
                           validator: (value){
                             if(value!.isEmpty){
                               return "Email can't be empty";
                             }
                             else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(value)){
                               return "Enter a valid email address";
                             }
                             return null;
                           },
                         ),
                         TextFormField(
                           controller: _otpController,
                           keyboardType: TextInputType.number,
                           decoration: InputDecoration(
                               prefixIcon: const Icon(Icons.domain_verification),
                               hintText: 'Enter Verification Code',
                               labelText: 'Verification',
                               suffixIcon: TextButton(
                                 child: const Text('Verify'),
                                 onPressed: ()=> verifyOtp(),
                               )
                           ),
                         ),
                       ],
                     ),

                   ),

              SizedBox(height: 25,),
              Center(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 55,vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  ),
                  onPressed: (){
                    if(_formKey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ManagerCreatePassword()));
                    }
                      },
                  child: Text(
                    'Next'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
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
                      color: Colors.blueAccent),
                    ),)
                ],
              ),
             ])
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

