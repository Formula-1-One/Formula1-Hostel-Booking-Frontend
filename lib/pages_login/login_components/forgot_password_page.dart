// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/login_page.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/widget/header_widget.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/common_for_login/theme_helper.dart';
import 'package:email_auth/email_auth.dart';

import 'create_password_page.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();

}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final double _headerHeight = 250;

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
    var res = emailAuth.validateOtp(recipientMail: _emailController.text, userOtp: _otpController.text);
    if(res){
      print("OTP verified");
      setState(() {
       // Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePasswordPage()));
      });
    }
    else{
      print("Invalid OTP");
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
                child: HeaderWidget(_headerHeight, true, Icons.password_rounded),
              ),
              const SizedBox(height: 20,),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Forgot Password ?',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                      // textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    Text('Enter the email address associated with your account.',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                      ),
                      // textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    Text('We will email you a verification code to check your authenticity.',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 18,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          hintText: 'Enter email',
                          labelText: 'Email',
                          suffixIcon: TextButton(
                            child: const Text('Send'),
                            onPressed: ()=> sendOtp(),
                          )
                      ),
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
                    const SizedBox(height: 10,),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10,0,10,20),
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push( context, MaterialPageRoute( builder: (context) => const LoginPage()), );
                        },
                        child: const Text( "Remember password ?  Login",
                          style: TextStyle( color: Colors.blue, ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePasswordPage()))
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      40, 10, 40, 10),
                  child: Text(
                    "Next".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
