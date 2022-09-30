// ignore_for_file: unnecessary_import, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_appbar_categories/logout.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/categories.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/houses.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/search_filter.dart';
import '../../pages_appbar_categories/feed.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/constants/constants.dart';


class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({Key? key}) : super(key: key);

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchFilter()));},
                icon: const Icon(Icons.search_outlined,
                color: Colors.blue,
                  size: 40,
                )),
          ),
        ],
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              const Houses(),
            ],
            ),
        ],
      ),
    );
  }
}