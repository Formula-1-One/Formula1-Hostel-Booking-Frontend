import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages/login_components/login_page.dart';
import 'package:flutter/cupertino.dart';
import '../common_for_login/theme_helper.dart';
import '../widget/header_widget.dart';
import 'forgot_password_page.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final double _headerHeight = 300;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.privacy_tip_outlined), // header widget common to login
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create New Password',
                        style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal,),
                      ),
                      const SizedBox(height: 15.0),
                      Form(
                        key: _formKey,
                        child: Column(
                            children: <Widget>[
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  controller: _password,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration( 'Enter your new password'),
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
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  controller: _confirmPassword,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration( 'Confirm your password'),
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
                              ),
                              const SizedBox(height: 15,),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10,0,10,20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => const ForgotPasswordPage()), );
                                },
                                  child: const Text( " Back ",
                                  style: TextStyle( color: Colors.blue, ),
                                ),
                              ),
                              ),
                              const SizedBox(height: 45.0),
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
                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                    }
                                  },
                                ),
                              )
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
