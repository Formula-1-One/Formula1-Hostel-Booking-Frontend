// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/manager_forgot_password.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:ManagerLoginPage() ,
));

class ManagerLoginPage extends StatefulWidget {
  const ManagerLoginPage({Key? key}) : super(key: key);

  @override
  State<ManagerLoginPage> createState() => _ManagerLoginPageState();
}

class _ManagerLoginPageState extends State<ManagerLoginPage> {
  bool hide = true;
  final _formKey = GlobalKey<FormState>();

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
                  padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
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
                        "Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 45
                        ),
                      ),
                      SizedBox(height: 30.0,),

                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Username'
                              ),
                            ),
                            SizedBox(height: 20.0,),

                            TextField(
                              obscureText: hide,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        hide = !hide;
                                      });
                                    },
                                    icon: hide? Icon(Icons.visibility_off):
                                    Icon(Icons.visibility),
                                  )
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => ManagerForgotPassword ()), );
                                },
                                child: Text('Forgot password?',
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent
                                ),),
                              ),
                            ),
                            Center(
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.deepPurpleAccent,
                                    padding: EdgeInsets.symmetric(horizontal: 45,vertical: 10)
                                ),
                                onPressed: (){},
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
