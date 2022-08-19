// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:ManagerPasswordVerification() ,
));

class ManagerPasswordVerification extends StatelessWidget {
  const ManagerPasswordVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
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
        child:Text(
          "MANAGER'S PAGE",
          style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ) ,
      ),
        ]),
            ]),
      )
    );
  }
}