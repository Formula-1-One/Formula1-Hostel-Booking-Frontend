import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/categories.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/houses.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/components/search_filter.dart';
import '../../pages_appbar_categories/feed.dart';
import '../../pages_appbar_categories/profile.dart';
import '../../pages_appbar_categories/settings.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({Key? key}) : super(key: key);

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Welcome",
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
              const Tab(icon: Icon(Icons.home), text: "Home",),
              InkWell(
                onTap: (){Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => const Feed()));},
                  child: const Tab(icon: Icon(Icons.list_alt), text: "Feed",)),
              InkWell(
                onTap: (){Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => const Profile()));},
                  child: const Tab(icon: Icon(Icons.person), text: "Profile",)),
              InkWell(
                  onTap: (){Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Settings()));},
                  child: const Tab(icon: Icon(Icons.settings), text: "Settings",)),
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
                const SearchFilter(),
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