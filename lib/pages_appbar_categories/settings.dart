import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_appbar_categories/profile.dart';

import '../pages_hostel/screens.home/home_screen_main.dart';
import 'feed.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Feed",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: (){},
          ),
          actions: [
            IconButton(onPressed: (){},
                icon: const Icon(Icons.notifications_none))
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
              InkWell(
                  onTap: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreenMain()));},
                  child: const Tab(icon: Icon(Icons.home), text: "Home",)),
               InkWell(
                   onTap: (){Navigator.push(context,
                       MaterialPageRoute(builder: (context) => const Feed()));},
                   child: const Tab(icon: Icon(Icons.list_alt), text: "Feed",)),
              InkWell(
                  onTap: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));},
                  child: const Tab(icon: Icon(Icons.person), text: "Profile",)),
              const Tab(icon: Icon(Icons.settings), text: "Settings",),
            ],
          ),
        ),
      ),
    );
  }
}
