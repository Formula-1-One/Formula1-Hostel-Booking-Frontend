// ignore_for_file: unnecessary_import

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/login_page.dart';
import 'package:flutter/cupertino.dart';
import '../common_for_login/theme_helper.dart';
import '../widget/header_widget.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController new_passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  void UpdatePassword(String username, new_password) async {
    var body =
    {
      "username": username,
      "new_password": new_password,
    };

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(
        Uri.parse("http://hostelhub.herokuapp.com/user/password/change"));
    request.headers.set('Content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    var data = json.decode(reply);
    httpClient.close();

    if(response.statusCode == 200){
      print(data);
      print(response.statusCode);
      print(" Password updated successfully");
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password updated successfully",style: TextStyle(fontSize: 25),),
            backgroundColor: Colors.blueAccent,));
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
    else{
      print(response.statusCode);
      print("Failed");
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password update unsuccessful ",style: TextStyle(fontSize: 25),),
            backgroundColor: Colors.redAccent,));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.privacy_tip_outlined), // header widget common to login
            ),
            const SizedBox(height: 40,),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Create New Password ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            SafeArea(
              child: Container(
                padding:  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          hintText: 'Enter your username',
                          labelText: 'User name',
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Username can't be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                       controller: new_passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                            prefixIcon: Icon(Icons.remove_red_eye_outlined),
                            hintText: 'Enter new password',
                            labelText: 'New password',
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "can't be empty";
                          }
                          // if(!RegExp(r"(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$").hasMatch(val)){
                          //   return "weak password";
                          // }
                          return null;
                        },
                      ),
                      SizedBox(height: 30,),
                      TextFormField(
                        controller: _confirmPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                            prefixIcon: Icon(Icons.remove_red_eye_outlined),
                            hintText: 'Enter new password',
                            labelText: 'Confirm new password',
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "can't be empty";
                          }
                          if(new_passwordController.text != _confirmPassword.text){
                            return "password do not match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: ElevatedButton(
                          style: ThemeHelper().buttonStyle(),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text('Done',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if(_formKey.currentState!.validate()) {

                              //Navigator.pushReplacement(
                              //  context, MaterialPageRoute(
                              //builder: (context) =>
                              //const LoginPage()));
                            }
                            UpdatePassword(usernameController.text.toString(), new_passwordController.text.toString()); //{
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
