import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/forgot_password_verification_page.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/login_page.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/widget/header_widget.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/common_for_login/theme_helper.dart';
import 'package:email_auth/email_auth.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();

}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  late EmailAuth emailAuth;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void sendOtp() async {
    emailAuth.sessionName = 'Test Session';
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
    }
    else{
      print("Invalid OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true, Icons.password_rounded),
              ),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
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
                      const SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: ThemeHelper().textInputDecoration("Email", "Enter your email"),
                                validator: (val){
                                  if(val!.isEmpty){
                                    return "Email can't be empty";
                                  }
                                  else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                    return "Enter a valid email address";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                    "Send".toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () => sendOtp() //{
                                  //if(_formKey.currentState!.validate()) {
                                    //Navigator.pushReplacement(
                                      //context,
                                      //MaterialPageRoute(
                                        //  builder: (context) => const ForgotPasswordVerificationPage()),
                                    //);
                                  //}
                                //},
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: "Remember your password ? "),
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const LoginPage()),
                                        );
                                      },
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
