import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/model/house.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/details/components/bottom_buttons.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/details/components/carousel_images.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/details/components/custom_app_bar.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/details/components/house_details.dart';

import '../../../JsonData/login_data.dart';


class DetailsScreen extends StatefulWidget {

  var data;

  DetailsScreen({required Key key, required this.data}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(widget.data["data"]["hostel_carousel_images"]),
                  CustomAppBar(),
                ],
              ),
              HouseDetails(data: widget.data),
            ],
          ),
          BottomButtons(),
        ],
      ),
    );
  }
}
