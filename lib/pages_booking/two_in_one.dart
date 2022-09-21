import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_booking/stepper_form.dart';

import '../pages_login/common_for_login/theme_helper.dart';

class TwoInOne extends StatefulWidget {
  const TwoInOne({Key? key}) : super(key: key);

  @override
  State<TwoInOne> createState() => _TwoInOneState();
}

class _TwoInOneState extends State<TwoInOne> {
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
            const Text("Click on the card to switch between gender",
              style: TextStyle(fontSize: 22),),
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
                      heightFactor: 6,
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
                        Text('2 in 1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                        SizedBox(width: 50,),
                        Text('28',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                      ],
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
                    heightFactor: 6,
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
                      Text('2 in 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                      SizedBox(width: 50,),
                      Text('62',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                    ],
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const StepperForm()));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
