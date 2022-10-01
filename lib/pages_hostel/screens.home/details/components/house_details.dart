// ignore_for_file: unused_import, unused_local_variable, unnecessary_import, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_booking/stepper_form.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/constants/constants.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/model/house.dart';

import '../../../../pages_booking/room_type.dart';

class HouseDetails extends StatefulWidget {

  var data;
  var referenceNumber;

  HouseDetails({Key? Key,this.referenceNumber ,this.data});

  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {

  @override
  Widget build(BuildContext context) {
    var hostelCarouselImages = widget.data["data"]["hostel_carousel_images"];
    var hostelDetails = widget.data["data"]["hostel_details"];
    var hostelFacilities = widget.data["data"]["hostel_facilities"];
    var hostelManager = widget.data["data"]["hostel_manager"];
    var hostelRoomTypes = widget.data["data"]["hostel_room_types"];

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
                          children: [
                         Text(
                          'Ratings',
                          style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 15,),
                           for (int i=0; i<hostelDetails["ratings"]; i++ )
                             Icon(Icons.star,
                               color: Colors.deepOrangeAccent,
                               size: 30,
                             )
                        ]
                      ),
                     const  SizedBox(height: 5,),
                      Text(
                        hostelDetails["name"],
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
                  for (int i=0; i<hostelRoomTypes.length;i++)
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
                                  MaterialPageRoute(builder: (context) => RoomType(referenceNumber: widget.referenceNumber, data: hostelRoomTypes[i])));},
                              child: Text(
                                '${hostelRoomTypes[i]["type"]} in 1',
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
                  Visibility(
                    visible: hostelFacilities.contains("wi_fi") ? true : false,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 145, 233, 148),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.wifi, size: 40),
                    ),
                  ),
                  Visibility(
                    visible: hostelFacilities.contains("air_conditioner") ? true : false,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 158, 228, 221),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.ac_unit_rounded, size: 40),
                    ),
                  ),
                  Visibility(
                    visible: hostelFacilities.contains("canteen") ? true : false,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 214, 167),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.restaurant, size: 40),
                    ),
                  ),
                  Visibility(
                    visible: hostelFacilities.contains("parking_lot") ? true : false,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 145, 233, 148),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.car_rental, size: 40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
