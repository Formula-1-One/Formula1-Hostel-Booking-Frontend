// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/common_for_login/theme_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/manager_create_password.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:ManagerPasswordVerification() ,
));

class ManagerPasswordVerification extends StatefulWidget {
  const ManagerPasswordVerification({Key? key}) : super(key: key);

  @override
  State<ManagerPasswordVerification> createState() => _ManagerPasswordVerificationState();
}

class _ManagerPasswordVerificationState extends State<ManagerPasswordVerification> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;
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
          padding: EdgeInsets.symmetric(horizontal: 35,vertical: 40),
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.35),
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.elliptical(50, 50), topLeft: Radius.elliptical(50, 50)),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Verification",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Enter the verification code we just sent you on your email address.',
                  style: TextStyle(
                     fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54
                  ),
                ),
                const SizedBox(height: 40.0),
                Form(
                  key: _formKey,
                  child: Column(
                      children: <Widget>[
                        OTPTextField(
                          length: 4,
                          width: 300,
                          fieldWidth: 60,
                          style: const TextStyle(
                              fontSize: 30
                          ),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            setState(() {
                              _pinSuccess = true;
                            });
                          },
                        ),
                        const SizedBox(height: 50.0),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "If you didn't receive a code! ",
                                style: TextStyle(
                                  color: Colors.black38,
                                ),
                              ),
                              TextSpan(
                                text: 'Resend',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ThemeHelper().alertDialog("Successful",
                                            "Verification code resend successful.",
                                            context);
                                      },
                                    );
                                  },
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        Container(
                          decoration: _pinSuccess ? ThemeHelper().buttonBoxDecoration(context):ThemeHelper().buttonBoxDecoration(context, "#AAAAAA","#757575"),
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                            ),
                            onPressed: _pinSuccess ? () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>  ManagerCreatePassword()
                                  ),
                                      (Route<dynamic> route) => false
                              );
                            } : null,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  40, 10, 40, 10),
                              child: Text(
                                "Verify".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                ]),
                )
      ]),),
        ]),
            ]),
      )
    );
  }
}