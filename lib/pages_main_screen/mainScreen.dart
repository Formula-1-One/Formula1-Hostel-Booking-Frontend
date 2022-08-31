// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/login_page.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


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
                              style: TextStyle(
                                fontSize: 70,
                                color: Colors.grey[200],
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              'ORMULA ',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.grey[200],
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
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
                            style:TextStyle(
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[200]
                            ),
                          ),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 50),
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
        width: double.infinity,
        height:450,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(topRight: Radius.elliptical(50, 50), topLeft: Radius.elliptical(50, 50)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.normal,
              color: Colors.blueAccent,
            ),
            ),
            SizedBox(height: 5.0,),
            Text(
              'Relax and book your favorite hostel online.\n'
                  'Live in the elegant comfort we have for you.\n'
                  'Only blissful satisfaction when you stay with us',
              style: TextStyle(
                fontSize: 16
              ),
            ),
            SizedBox(height: 60.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
                  ),

                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },

                    child:Text('Student',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        color: Colors.blueAccent
                      ),
                    ),
                ),
                SizedBox(width: 40.0,),
                ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),

                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ManagerLoginPage()));
                  },
                    child: Text('Manager',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[200]
                      ),
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

