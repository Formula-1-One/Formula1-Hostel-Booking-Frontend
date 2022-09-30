import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_appbar_categories/feed.dart';
import 'package:hostel_booking_app_ui_f1/pages_appbar_categories/logout.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/home_screen_main.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin{

  late TabController tabController;
  var fabIcon = Icons.search;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {
          switch(tabController.index){
            case 0:
              fabIcon = Icons.add_circle_rounded;
              break;
            case 1:
              fabIcon = Icons.chat;
              break;
            case 2:
              fabIcon = Icons.camera_alt_outlined;
              break;
          }
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(child: Text('HOME')),
            Tab(child: Text('ABOUT'),),
            Tab(child: Text('LOG OUT'),),

          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          HomeScreenMain(),
          Feed(),
          LogOUt(),
        ],
      ),

    );
  }
}
