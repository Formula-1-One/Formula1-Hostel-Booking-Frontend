// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/login_page.dart';
import 'package:flutter/cupertino.dart';
import '../common_for_login/theme_helper.dart';
import '../widget/header_widget.dart';
import 'package:http/http.dart' as http;

class CreatePasswordPage extends StatefulWidget {
  //Map<String, dynamic> user;
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

 // initState(){
   // _password.text = widget.user["password"];
   // _confirmPassword.text = widget.user["confirmPassword"];
  //}

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
            SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                     controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.remove_red_eye_outlined),
                          hintText: 'Enter new password',
                          labelText: 'New password',
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return "can't be empty";
                        }
                        if(!RegExp(r"(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$").hasMatch(val)){
                          return "weak password";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _confirmPassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.remove_red_eye_outlined),
                          hintText: 'Enter new password',
                          labelText: 'Confirm new password',
                      ),
                      validator: (val){
                        if(val!.isEmpty){
                          return "can't be empty";
                        }
                        if(_password.text != _confirmPassword.text){
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
                            //updatePassword(id: widget.user["id"]);
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                builder: (context) =>
                                const LoginPage()));
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void updatePassword ({required int id}) async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users/$id");
    var response = await http.put(url);
    if(response.statusCode == 200){
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("New Password created successfully",style: TextStyle(fontSize: 25)),
            backgroundColor: Colors.blue,));
    }
  }
}
