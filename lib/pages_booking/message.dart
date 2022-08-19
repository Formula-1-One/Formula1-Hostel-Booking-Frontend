import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/common_for_login/theme_helper.dart';

import '../pages_hostel/constants/constants.dart';
import '../pages_login/widget/header_widget.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final TextEditingController controller = TextEditingController();
  double _headerHeight = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.message_outlined),
            ),
            const SizedBox(height: 100,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (controller.value.text.isEmpty) ?
                  const Text("Please enter a message", style: TextStyle(
                    fontSize: 25,
                  ),) : Text("Sent Message: ${controller.value.text}", style: const TextStyle(
                    fontSize: 25,
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: controller,
                      minLines: 2,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText: "Enter your message here",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text('Send Message',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        onPressed: (){
                      setState(() {
                        controller.notifyListeners();
                      });
                    },),
                  ),
                  const SizedBox(height: 35,),
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
            ),
          ],
        ),
      ),
    );
  }
}
