// ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import


import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/details/tabView.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/home_screen_main.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/forgot_password_page.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/widget/header_widget.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/common_for_login/theme_helper.dart';

import '../../pages_hostel/screens.home/components/houses.dart';
import '../../pages_hostel/screens.home/second_screen.dart';


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
  var data;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


   void login(String username, password) async {
    var body =
    {
      "username": username,
      "password": password,
    };

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(
        Uri.parse("http://hostelhub.herokuapp.com/login/student"));
    request.headers.set('Content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    data = json.decode(reply);
    httpClient.close();

    if(response.statusCode == 200){
      print(data);
      print(response.statusCode);
      print("Login successful");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Tabs(data: data)));
    }
    else{
      print(response.statusCode);
      print("Login failed");
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid credentials ",style: TextStyle(fontSize: 25),),
            backgroundColor: Colors.redAccent,));
    }
  }

  
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
                                    controller: usernameController,
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
                                    controller: passwordController,
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
                                      style: TextStyle( color: Colors.blue, ),
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
                                      login(usernameController.text.toString(), passwordController.text.toString());
                                      if(_formKey.currentState!.validate()) {
                                        //Navigator.pushReplacement(
                                            //context, MaterialPageRoute(
                                            //builder: (context) =>
                                               // const HomeScreenMain()));
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