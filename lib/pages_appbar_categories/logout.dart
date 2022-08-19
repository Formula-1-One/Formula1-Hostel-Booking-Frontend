import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_appbar_categories/profile.dart';
import '../pages_hostel/screens.home/home_screen_main.dart';
import 'alert_dialog.dart';
import 'feed.dart';

class LogOUt extends StatefulWidget {
  const LogOUt({Key? key}) : super(key: key);

  @override
  State<LogOUt> createState() => _LogOUtState();
}

class _LogOUtState extends State<LogOUt> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Log out",
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
              InkWell(
                  onTap: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));},
                  child: const Tab(icon: Icon(Icons.person), text: "Profile",)),
              InkWell(
                  onTap: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LogOUt()));},
                  child: const Tab(icon: Icon(Icons.logout), text: "Log out",)),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/ba.JPG'
              ),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: RaisedButton(onPressed: () async {
              final action = await AlertDialogs.yesCancelDialog(context, 'Logout', 'are you sure ? ');
            },
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Text("Log out",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
