import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_booking_app_ui_f1/pages_appbar_categories/logout.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/screens.home/home_screen_main.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}


class _FeedState extends State<Feed> {
  Widget buildListTile({
    required String title,
    ImageProvider? image,
  }) =>
      ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.cyan[100],
          backgroundImage: image,
          foregroundColor: Colors.white,
          radius: 48,
          onBackgroundImageError: image != null
              ? (e, stackTrace) {
            print('e: ${e}');
          }
              : null,
          child: image == null
              ? Text(
            title[0].toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          )
              : Container(height: 0, width: 0),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  Widget buildMinMaxAvatar() {
    final double size = 100;

    return Container(
      width: size,
      height: size,
      child: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/image.jpg'),
          minRadius: 12,
          maxRadius: 36,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("About",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
          centerTitle: true,
          automaticallyImplyLeading: false,
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreenMain()));
                  },
                  child: const Tab(icon: Icon(Icons.home), text: "Home",)),
              const Tab(icon: Icon(Icons.info), text: "About",),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => const LogOUt()));
                  },
                  child: const Tab(icon: Icon(Icons.logout), text: "Log out",)),
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('F 1',
                    style: GoogleFonts.lobster(
                      textStyle:
                      TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic

                      ),)),
                radius: 40,
              ),
              SizedBox(height: 25,),
              Text('Description',
                  style: GoogleFonts.poppins(
                    textStyle:
                    TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Text(
                  'This is the Formula 1 hostel booking app. This app was designed to help students find hostels for accommodation.'
                      'A university is in charge of hostels that provide accommodation to students.'
                      'Some problems have been identified and the university decides to award Formula 1 group a contract '
                      'to develop a software solution to solve the identified problem.\n'
                      'The app was created by 11 members of the COE 3 class as a project in their Software Engineering course.',
                  style: GoogleFonts.poppins(
                    textStyle:
                    TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic
                    ),
                  )),
              SizedBox(height: 20,),

              buildListTile(
                title: 'A A Machele',
                image: AssetImage('assets/images/avatar1.png'),
              ),
              buildListTile(
                title: 'T K Jesse',
                image:AssetImage('assets/images/avatar2.png'),
              ),
              buildListTile(
                title: 'A K Benjamin',
                image: AssetImage('assets/images/avatar3.png'),
              ),
              buildListTile(
                  title: 'D O A Eric',
                  image: AssetImage('assets/images/avatar4.png')
              ),
              buildListTile(
                  title: 'I I Gibril',
                  image: AssetImage('assets/images/avatar5.png')
              ),
              buildListTile(
                  title: 'T Sampson',
                  image: AssetImage('assets/images/avatar6.png')
              ),

              buildListTile(
                title: 'A A Caleb',
                image: AssetImage('assets/images/avatar10.png'),
              ),

              buildListTile(
                  title: 'O A Kofi',
                  image: AssetImage('assets/images/avatar7.png')
              ),
              buildListTile(
                  title: 'O Y Samuel',
                  image: AssetImage('assets/images/avatar8.png')
              ),
              buildListTile(
                  title: 'O B Nana Kwame',
                  image: AssetImage('assets/images/avatar9.png')
              ),
              buildListTile(
                  title: 'Y Zakiyu',
                  image: AssetImage('assets/images/avatar11.png')
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.copyright_rounded,),
                  SizedBox(width: 10,),
                  Text('Copyright 2022, Formula 1 Hostel Booking App',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15
                        )
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}

