// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/common_for_login/theme_helper.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/login_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';



void main () => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:MainScreen() ,
));

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                            child: Image.asset('assets/images/F1-LOGO.png',
                              scale: 5,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'F',
                                  style:GoogleFonts.gothicA1(
                                    textStyle: TextStyle(
                                      fontSize: 70,
                                      color: Colors.grey[200],
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                    ),)
                              ),
                              Text(
                                  'ORMULA ',
                                  style:GoogleFonts.gothicA1(
                                    textStyle:
                                    TextStyle(
                                      fontSize: 40,
                                      color: Colors.grey[200],
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),)
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.grey[200],
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Text(
                                'HOSTEL BOOKING ',
                                style:GoogleFonts.gothicA1(
                                    textStyle: TextStyle(color: Colors.grey[200]),
                                    fontSize: 20
                                )
                            ),
                          ),
                        ]),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 40),
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
              width: double.infinity,
              height:480,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(topRight: Radius.elliptical(50, 50), topLeft: Radius.elliptical(50, 50)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi there!',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.blueAccent),
                        fontSize: 30,

                      )
                  ),
                  Text('Welcome',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.blueAccent),
                        fontSize: 45,

                      )
                  ),
                  SizedBox(height: 15.0,),
                  Text(
                      'F1 is the best way to locate and reserve a room at the hostel of your choice.'
                          'Book a room here and enjoy life.',
                      style: GoogleFonts.gothicA1(
                          textStyle: TextStyle(color: Colors.blueAccent,
                              fontSize: 17,
                              fontWeight: FontWeight.w600
                          )
                      )
                  ),
                  SizedBox(height: 35.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text('Get started',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            }
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
