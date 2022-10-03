// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

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
  final _formKey = GlobalKey<FormState>();

  EmailAuth emailAuth = EmailAuth(sessionName: "F1 Hostel Booking");

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  void sendOtp() async {
    var res = await emailAuth.sendOtp(recipientMail: _emailController.text);
    if(res){
      print("OTP sent");
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Verification code sent",style: TextStyle(fontSize: 25),),
            backgroundColor: Colors.blueAccent,));
    }
    else{
      print("we could not send OTP, check email");
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("could not send verification code",style: TextStyle(fontSize: 25),),
            backgroundColor: Colors.redAccent,));
    }
  }

  Future<void> verifyOtp() async {
    var res = emailAuth.validateOtp(recipientMail: _emailController.text, userOtp: _otpController.text);
    if(res){
      print("OTP verified");
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Successful verification",style: TextStyle(fontSize: 25),),
            backgroundColor: Colors.blueAccent,));
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePasswordPage()));
    }
    else{
      print("Invalid OTP");
       await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Check verification code",style: TextStyle(fontSize: 25),),
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
                child: HeaderWidget(_headerHeight, true, Icons.password_rounded),
              ),
              const SizedBox(height: 20,),
              Container(
                padding:  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Center(
                      child: Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Enter and send the email address associated with your account.',
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
                child: Container(
                  padding:  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                            ),
                              prefixIcon: const Icon(Icons.email_outlined),
                              hintText: 'Enter email',
                              labelText: 'Email',
                              suffixIcon: TextButton(
                                child: const Text('Send'),
                                onPressed: ()=> sendOtp(),
                              )
                          ),
                          validator: (val){
                            if(val!.isEmpty){
                              return "Email can't be empty";
                            }
                            if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)){
                              return "Invalid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: _otpController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              prefixIcon: const Icon(Icons.domain_verification),
                              hintText: 'Enter Verification Code',
                              labelText: 'Verification',
                             // suffixIcon: TextButton(
                               // child: const Text('Verify'),
                                //onPressed: ()=> verifyOtp(),
                              //)
                          ),
                          validator: (val){
                            if(val!.isEmpty){
                              return "Input verification code";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10,0,10,20),
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Remember password?'),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => const LoginPage()), );
                                },
                                child: const Text( "Login",
                                  style: TextStyle( color: Colors.blue, ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                onPressed: () => {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePasswordPage())),
                  if(_formKey.currentState!.validate()){
                    verifyOtp(),
                  }
                  },
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
            ],
          ),
        ),
    );
  }
}
