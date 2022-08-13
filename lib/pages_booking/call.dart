import 'package:flutter/material.dart';

import '../pages_hostel/constants/constants.dart';
import '../pages_login/widget/header_widget.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true, Icons.call_outlined),
              ),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Would you like to call for help ?',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 15,),
                            Text('You can contact us through any of the lines below',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text('+233 243 711 109',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text('+233 501 333 846',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text('+233 243 069 633',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: white.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black,
                      size: 50,),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
