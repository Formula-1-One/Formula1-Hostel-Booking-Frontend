import 'package:flutter/material.dart';

import '../pages_login/common_for_login/theme_helper.dart';
import '../pages_printing/print_page.dart';

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
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Kindly come along with this details printed out",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              const SizedBox(height: 20,),
              Text('Name: ${studentProfile["first_name"]} ${studentProfile["last_name"]}', style: const TextStyle( fontSize: 20),),
              const SizedBox(height: 15,),
              Text('Reference Number: ${studentProfile["reference_number"]}', style: const TextStyle( fontSize: 20)),
              const SizedBox(height: 15,),
              Text('Phone Number:  ${studentProfile["phone_number"]}', style: const TextStyle( fontSize: 20)),
              const SizedBox(height: 15,),
              Text('Programme of study: ${studentProfile["program_of_study"]}', style: const TextStyle( fontSize: 20)),
              const SizedBox(height: 80,),
              Center(
                child: Container(
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text('Next',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) =>
                        //         PrintPage(
                        //
                        //             )));
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
