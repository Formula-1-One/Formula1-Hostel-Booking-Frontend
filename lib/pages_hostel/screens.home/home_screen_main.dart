// ignore_for_file: unnecessary_import, unused_import

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_appbar_categories/logout.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/categories.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/houses.dart';
import '../../JsonData/login_data.dart';
import '../../pages_appbar_categories/feed.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/constants/constants.dart';



class HomeScreenMain extends StatefulWidget {
  var data;
  HomeScreenMain({Key? key, this.data}) : super(key: key);

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
               Padding(
                 padding: const EdgeInsets.only(left: 80),
                 child: Row(
                   children: [
                     Center(
                       child: Text("Welcome",
                         style: TextStyle(fontSize: 30,fontWeight:  FontWeight.bold ),),
                     ),
                     SizedBox(width: 10,),
                     Center(
                       child: Text("${widget.data["data"]["student_profile"]["first_name"]}"
                           " ${widget.data["data"]["student_profile"]["last_name"]}",
                       style:  TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                     )
                   ],
                 ),
               ),
               Houses(data: widget.data),
            ],
            ),
        ],
      ),
    );
  }
}