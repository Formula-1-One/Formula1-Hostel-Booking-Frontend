import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {

  var data;

  SecondPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text(data["data"]["auth-token"])
            ],
          )
        ],
      ),
    );
  }
}
