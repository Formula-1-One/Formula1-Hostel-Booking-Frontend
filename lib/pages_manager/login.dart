// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home:LoginPage() ,
));

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("FORMULA 1 HOSTEL BOOKING"),
        elevation: 10.0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(80, 35, 40, 0),
                child:Text(
                  "MANAGER'S PAGE",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ) ,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35,vertical: 20),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.elliptical(100, 100), topLeft: Radius.elliptical(100, 100)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 45
                        ),
                      ),
                      SizedBox(height: 30.0,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Username'
                        ),
                      ),
                      SizedBox(height: 20.0,)
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
