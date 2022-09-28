// ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:hostel_booking_app_ui_f1/pages_booking/stepper_form.dart';
import '../pages_login/common_for_login/theme_helper.dart';

class FourInOne extends StatefulWidget {
  const FourInOne({Key? key}) : super(key: key);

  @override
  State<FourInOne> createState() => _FourInOneState();
}

class _FourInOneState extends State<FourInOne> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available bed spaces ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900, Colors.blue
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft
              )
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Click card to select gender",
              style: TextStyle(fontSize: 25),),
            ),
            const SizedBox(height: 20,),
            FlipCard(
              front: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade600,
                ),
                padding: const EdgeInsets.only(
                    top: 20,
                    left: 90,
                ),
              alignment: Alignment.center,
              width: 400,
              height: 400,
              child: Column(
                children: [
                  Center(
                    heightFactor: 4,
                    child: Row(
                      children: const [
                        Text('Type',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                        SizedBox(width: 50,),
                        Text('Males',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                      ],
                    ),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('4 in 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                      SizedBox(width: 50,),
                      Text('20',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                    ],
                  ),
                  Center(
                    heightFactor: 4,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Price',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                        SizedBox(width: 50,),
                        Text('4000 cedis',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
            ), back: Container(
              padding: const EdgeInsets.only(
              top: 20,
              left: 90
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
              ),
              width: 400,
              height: 400,
              child: Column(
                children: [
                  Center(
                    heightFactor: 4,
                    child: Row(
                      children: const [
                        Text('Type',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                        SizedBox(width: 50,),
                        Text('Females',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                      ],
                    ),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('4 in 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                      SizedBox(width: 50,),
                      Text('20',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                    ],
                  ),
                  Center(
                    heightFactor: 4,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Price',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                        SizedBox(width: 50,),
                        Text('4000 cedis',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Text('Book Now',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StepperForm()));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
