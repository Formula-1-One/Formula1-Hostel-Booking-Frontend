// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/login.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/manager_forgot_password.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:ManagerCreatePassword() ,
));

class ManagerCreatePassword extends StatefulWidget {
  const ManagerCreatePassword({Key? key}) : super(key: key);

  @override
  State<ManagerCreatePassword> createState() => _ManagerCreatePasswordState();
}

class _ManagerCreatePasswordState extends State<ManagerCreatePassword> {
  bool hide = true;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();


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
                          child: Icon(Icons.privacy_tip_outlined,
                            color: Colors.white,
                            size: 100.0,),
                        ),
                      ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 80),
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.elliptical(100, 100), topLeft: Radius.elliptical(100, 100)),
            ),
          child: Form(
            key: _formKey,
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
                SizedBox(height: 40.0,),
                TextField(
                  controller: password,
                  obscureText: hide,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            hide= !hide;
                          });
                        },
                        icon:hide? Icon(Icons.visibility_off):
                        Icon(Icons.visibility),
                      )
                  ),
                ),
                SizedBox(height: 30.0,),
                TextFormField(
                  controller: confirmPassword,
                  obscureText: hide,
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            hide= !hide;
                          });
                        },
                        icon:hide? Icon(Icons.visibility_off):
                        Icon(Icons.visibility),
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "can't be empty";
                    }
                    if(!RegExp(r"(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$").hasMatch(value)){
                      return "enter a strong password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.0,),
                Center(
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 55,vertical: 20),
                    ),
                    onPressed: (){
                      if(password.text != confirmPassword.text){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text('Alert!!!'),
                            content: Text('Passwords do not match'),
                          );
                        }
                        );
                      }
                      else if(_formKey.currentState!.validate()) {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => ManagerLoginPage()));
                    }},
                    child: Text(
                      'Done',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),),
                ),
        ]),
          )
        ),

                    ]),
              ]),
        )
    );
  }
}