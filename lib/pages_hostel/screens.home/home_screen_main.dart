// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_appbar_categories/logout.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/categories.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/houses.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/search_filter.dart';
import '../../pages_appbar_categories/feed.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({Key? key}) : super(key: key);

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Welcome",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: (){Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchFilter()));},
                icon: const Icon(Icons.search_outlined))
          ],
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
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            // isScrollable: true,
            tabs: [
              const Tab(icon: Icon(Icons.home), text: "Home",),
              InkWell(
                onTap: (){Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => const Feed()));},
                  child: const Tab(icon: Icon(Icons.info), text: "About",)),
              InkWell(
                  onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LogOUt()));},
                  child: const Tab(icon: Icon(Icons.logout), text: "Log out",)),
            ],
          ),
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
                Categories(),
                const Houses(),
              ],
              ),
          ],
        ),
      ),
    );
  }
}