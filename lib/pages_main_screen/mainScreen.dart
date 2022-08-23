
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/login_page.dart';
import 'package:hostel_booking_app_ui_f1/pages_manager/login.dart';

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
                  padding: EdgeInsets.fromLTRB(80, 35, 40, 0),

                ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
        width: double.infinity,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.elliptical(100, 100), topLeft: Radius.elliptical(100, 100)),
        ),
        child: Column(
          children: [
            Text('Welcome!!!',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 70.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                    child:Text('Student >>',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                ),
                SizedBox(width: 40.0,),
                ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ManagerLoginPage()));
                  },
                    child: Text('Manager >>',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
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
          ],
        ),
      ),
    );
  }
}

