// ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/home_screen_main.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/forgot_password_page.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/widget/header_widget.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/common_for_login/theme_helper.dart';

void main() => runApp(MaterialApp(
  home: LoginPage(),
  debugShowCheckedModeBanner: false,
));

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded), // header widget common to login
            ),
            const Text(
             "Book-Up !",
             style: TextStyle(
               fontSize: 40,
               fontStyle: FontStyle.italic
             ),
                ),
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.normal,),
                        ),
                        const SizedBox(height: 30.0),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: ThemeHelper().inputBoxDecorationShadow(),
                                  child: TextFormField(
                                    decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                                    validator: (val){
                                      if(val!.isEmpty){
                                        return "Username can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 30.0),
                                Container(
                                  decoration: ThemeHelper().inputBoxDecorationShadow(),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                                    validator: (val){
                                      if(val!.isEmpty){
                                        return "Password can't be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,0,10,20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push( context, MaterialPageRoute( builder: (context) => const ForgotPasswordPage()), );
                                    },
                                    child: const Text( "Forgot password ?",
                                      style: TextStyle( color: Colors.grey, ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: ThemeHelper().buttonBoxDecoration(context),
                                  child: ElevatedButton(
                                    style: ThemeHelper().buttonStyle(),
                                    child: const Padding(
                                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Text('Log in',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if(_formKey.currentState!.validate()) {
                                        Navigator.pushReplacement(
                                            context, MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreenMain()));
                                      }
                                    },
                                ),
                                ),
                            ]
                        ),
                        ),
                    ]
              ),
                  ),
            ),
            ],
        ),
      ),
    );

  }
}