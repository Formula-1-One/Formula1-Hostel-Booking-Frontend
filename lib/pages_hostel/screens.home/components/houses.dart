import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/constants/constants.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/data/data.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/data/data_home.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/model/house.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/details/details_screen.dart';
import 'package:like_button/like_button.dart';

class Houses extends StatefulWidget {
  const Houses({Key? key}) : super(key: key);


  @override
  _HousesState createState() => _HousesState();
}

class _HousesState extends State<Houses> {

  DataHome object = DataHome();

  Widget _buildHouse(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    House house = houseList[index];

    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(house: house, key:UniqueKey()),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: appPadding / 2),
        child: SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      height: 180,
                      width: size.width,
                      fit: BoxFit.cover,
                      image: AssetImage(house.imageUrl)),
                  ),
                  Positioned(
                    right: appPadding / 2,
                    top: appPadding / 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: LikeButton(
                        size: 40,
                      )
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 30,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      object.getData[index].name,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.black,
                        ),
                        Text(
                          object.getData[index].location,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],),
        ),
        ),
    );

  }
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: houseList.length,
        itemBuilder: (context, index) {
          return _buildHouse(context, index);
        }),
    );
  }
}