// ignore_for_file: unused_local_variable, unused_import

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
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: Image.asset('assets/images/F1-LOGO.png',
                            scale: 5,),
                        ),

                ],
              ),
              Center(
                child: ElevatedButton(onPressed: () async {
                  final action = await AlertDialogs.yesCancelDialog(context, 'Logout', 'are you sure ? ');
                },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
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
    ]));
  }
}
