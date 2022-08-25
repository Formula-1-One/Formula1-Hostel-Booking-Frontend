import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:hostel_booking_app_ui_f1/pages_booking/stepper_form.dart';

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
        title: Text('Available bed spaces '),
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
            FlipCard(
              front: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red,
                ),
              alignment: Alignment.center,
              width: 300,
              height: 400,
              child: Text('Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),),
            ), back: Container(
              padding: EdgeInsets.only(
              top: 20,
              left: 30
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
              ),
              width: 300,
              height: 400,
              child: Column(
                children: [
                  Text('Type: Males  Female',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),),
                  Text('4 in 1: 25  50',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),),
                ],
              ),
            ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  StepperForm()));
            }, child: const Text('BOOK',
              style: TextStyle(fontSize: 30),)),
          ],
        ),
      ),
    );
  }
}
