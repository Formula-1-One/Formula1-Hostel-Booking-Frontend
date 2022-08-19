import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_appbar_categories/logout.dart';
import '../pages_hostel/screens.home/home_screen_main.dart';
import 'feed.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.car_rental_outlined),
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
              const Tab(icon: Icon(Icons.person), text: "Profile",),
              InkWell(
                  onTap: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LogOUt()));},
                  child: const Tab(icon: Icon(Icons.logout), text: "Log out",)),
            ],
          ),
        ),
      ),
    );
  }
}
