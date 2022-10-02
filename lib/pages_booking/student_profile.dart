import 'package:flutter/material.dart';

class StudentProfile extends StatefulWidget {
  var data;
  StudentProfile({Key? key, this.data}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    var studentProfile = widget.data["data"]["student_profile"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Student Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 70),
            child: Container(
              child: Text("Name: ${studentProfile["first_name"]} ${studentProfile["last_name"]}"),
            ),
          ),
          Container(
            child: Text("Reference Number: ${studentProfile["reference_number"]}"),
          ),
          Container(
            child: Text("Phone: ${studentProfile["phone_number"]}"),
          ),
          Container(
            child: Text("Program of Study: ${studentProfile["program_of_study"]}"),
          )
        ],
      ),
    );
  }
}
