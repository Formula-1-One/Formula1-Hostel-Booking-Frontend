
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
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.6),
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(topRight: Radius.elliptical(50, 50), topLeft: Radius.elliptical(50, 50)),
        ),
        child: Column(
          children: [
            Text('WELCOME',
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent,
              fontStyle: FontStyle.italic,
            ),
            ),
            SizedBox(height: 70.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.redAccent[100],
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
                      backgroundColor: Colors.yellowAccent[100],
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
                        color: Colors.blueAccent
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

