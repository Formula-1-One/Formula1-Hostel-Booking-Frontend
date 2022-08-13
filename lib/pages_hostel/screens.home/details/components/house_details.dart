import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/constants/constants.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/model/house.dart';

import '../../../../pages_booking/four_in_one.dart';
import '../../../../pages_booking/one_in_one.dart';
import '../../../../pages_booking/three_in_one.dart';
import '../../../../pages_booking/two_in_one.dart';

class HouseDetails extends StatefulWidget {

  final House house;

  HouseDetails(this.house);

  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Expanded(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    bottom: appPadding,
                    left: appPadding,
                    right: appPadding
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          children: const [
                         Text(
                          'Best of accommodation',
                          style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 18,),
                           Icon(Icons.star,
                             color: Colors.orange,
                             size: 30,
                           ),
                            Icon(Icons.star,
                              color: Colors.orange,
                              size: 30,
                            ),
                            Icon(Icons.star,
                              color: Colors.orange,
                              size: 30,
                            ),
                            Icon(Icons.star,
                              color: Colors.orange,
                              size: 30,
                            )
                        ]
                      ),
                     const  SizedBox(height: 5,),
                      Text(
                        widget.house.address,
                        style: TextStyle(
                          fontSize: 15,
                          color: black.withOpacity(0.4),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),

                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: appPadding, bottom: appPadding),
              child: Text(
                'Kinds of rooms available',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: appPadding,
                      bottom: appPadding,
                    ),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: black.withOpacity(0.4)
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const FourInOne()));},
                            child: const Text(
                              '4 in a room',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: appPadding,
                      bottom: appPadding,
                    ),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: black.withOpacity(0.4)
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){Navigator.push(context,
                                MaterialPageRoute(builder: ((context) => const ThreeInOne())));},
                            child: const Text(
                              '3 in a room',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: appPadding,
                      bottom: appPadding,
                    ),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: black.withOpacity(0.4)
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const TwoInOne()));},
                            child: const Text(
                              '2 in a room',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: appPadding,
                      bottom: appPadding,
                    ),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: black.withOpacity(0.4)
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const OneInOne()));},
                            child: const Text(
                              '1 in a room',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 145, 233, 148),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.wifi, size: 40),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 158, 228, 221),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.ac_unit_rounded, size: 40),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 214, 167),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.restaurant, size: 40),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 145, 233, 148),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.car_rental, size: 40),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: appPadding,
                  right: appPadding,
                  bottom: appPadding * 4,
                ),
              child: Text(
                widget.house.description,
                style: TextStyle(
                  color: black.withOpacity(0.4),
                  height: 1.5,
                ),
              ),
            ),
          ],
        )
    );
  }
}
