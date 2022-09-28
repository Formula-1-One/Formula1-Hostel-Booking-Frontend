// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("Log out",
            style:GoogleFonts.gothicA1(
            textStyle:
            TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),),
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
                  child: const Tab(icon: Icon(Icons.info), text: "About",)),
              InkWell(
                  onTap: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LogOUt()));},
                  child: const Tab(icon: Icon(Icons.logout), text: "Log out",)),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                            child: Image.asset('assets/images/F1-LOGO.png',
                              scale: 5,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'F',
                                style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                'ORMULA ',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Text(
                              'HOSTEL BOOKING ',
                              style:TextStyle(
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
                Center(
                  child: ElevatedButton(onPressed: () async {
                    final action = await AlertDialogs.yesCancelDialog(context, 'Logout', 'are you sure ? ');
                  },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    child:Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Log out",
                        style: GoogleFonts.gothicA1(
                          textStyle:
                        TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),),
                  ),
                    ),)
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
