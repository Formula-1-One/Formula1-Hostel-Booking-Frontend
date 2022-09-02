// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:myappp/anime.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: WelcomePage(),
));

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(150, 400, 1, 1),
          Color.fromRGBO(200, 200, 200,200),

        ],
          begin: Alignment.topCenter, end: Alignment.bottomCenter
        ),
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: topPadding),
            SizedBox(height: 10,),
           AnimatedImage(),

            SizedBox(height: 250.0,),
            Text('WELCOME',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w600,
                color: Colors.greenAccent,
              ),
            ),
            SizedBox(height: 90.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))
                  ),

                  onPressed: (){},

                  child:Text('Student',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87
                    ),
                  ),
                ),
                SizedBox(width: 40.0,),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[500],
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))

                  ),
                  onPressed: (){
                  },
                  child: Text('Manager',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      )
    );
  }
}
