import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/JsonData/login_data.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/constants/constants.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/details/details_screen.dart';

class Houses extends StatefulWidget {
  var data;
  Houses({Key? key, this.data}) : super(key: key);


  @override
  _HousesState createState() => _HousesState();
}

class _HousesState extends State<Houses> {
  List<Hostel> hostelList = [];
  var hostelDetailsResponse;

  void getHostelDetails(String id) async {

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(
        Uri.parse("http://hostelhub.herokuapp.com/hostels/${id}"));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    hostelDetailsResponse = json.decode(reply);
    httpClient.close();

    if(response.statusCode == 200){
      print(hostelDetailsResponse);
      print(response.statusCode);
      print("Got Hostel Details successfully");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailsScreen(
              data: hostelDetailsResponse,
              referenceNumber: widget.data["data"]["student_profile"]["reference_number"],
              key:UniqueKey()
          ),
        ),
      );
    }
    else{
      print(response.statusCode);
      print("hostel details request failed");
    }
  }



  Widget _buildHostel(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Hostel hostel = hostelList[index];
    print(hostelList.length);

    return GestureDetector(
      onTap: (){
        getHostelDetails("${hostel.hostelId}");
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
                        image: NetworkImage('${hostel.image}')),
                  ),
                  Positioned(
                    right: appPadding / 2,
                    top: appPadding / 2,
                    child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(15)
                        ),
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
                      // object.getData[index].name,
                      '${hostel.name}',
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
                          // object.getData[index].location,
                          '${hostel.location}',
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
    hostelList = [];
    widget.data["data"]["hostels"].forEach((v) {
      hostelList.add(new Hostel.fromJson(v));
    });

    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: hostelList.length,
          itemBuilder: (context, index) {
            return _buildHostel(context, index);
          }),
    );
  }
}