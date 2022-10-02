// ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:hostel_booking_app_ui_f1/pages_booking/student_profile.dart';
import '../pages_login/common_for_login/theme_helper.dart';

class RoomType extends StatefulWidget {
  var data;
  RoomType({Key? key,this.data}) : super(key: key);

  @override
  State<RoomType> createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  var bookingResponse;

  void sendBookingDetails(String reference_number, String room_type_id) async {
    var body =
    {
      "reference_number": reference_number,
      "room_type_id": room_type_id,
    };

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(
        Uri.parse("http://hostelhub.herokuapp.com/booking"));
    request.headers.set('Content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    bookingResponse = json.decode(reply);
    httpClient.close();

    if(response.statusCode == 200){
      print(bookingResponse);
      print(response.statusCode);
      print("booking successful");
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Booking pending, make payment in 3 days to confirm",style: TextStyle(fontSize: 25),),
            backgroundColor: Colors.blueAccent,));
      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfile(data: bookingResponse)));
    }
    else{
      print(response.statusCode);
      print(bookingResponse["error_message"]);
      await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(bookingResponse["error_message"],style: TextStyle(fontSize: 25),),
            backgroundColor: Colors.redAccent,));
    }
  }

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
              child: const Text("Tap card to switch gender",
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
                    left: 50,
                ),
              alignment: Alignment.center,
              width: 400,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(width: 90,),
                        Text('Males',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text('Available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                      SizedBox(width: 35,),
                      Text('${widget.data["available_male_bed_spaces"]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                    ],
                  ),
                  Center(
                    heightFactor: 4,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                        SizedBox(width: 90,),
                        Text('GHS ${widget.data["price"]}',
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
              left: 50
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text('Type',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),),
                        ),
                        SizedBox(width: 90,),
                        Text('Female',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),),
                      ],
                    ),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                      SizedBox(width: 35,),
                      Text('${widget.data["available_female_bed_spaces"]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),),
                    ],
                  ),
                  Center(
                    heightFactor: 4,
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('Price',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),),
                        ),
                        SizedBox(width: 75,),
                        Text('GHS ${widget.data["price"]}',
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
                  sendBookingDetails('${widget.data["reference_number"]}', '${widget.data["id"]}');
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
