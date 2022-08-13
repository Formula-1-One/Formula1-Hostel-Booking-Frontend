import 'package:flutter/material.dart';
import 'package:hostel_booking_app_ui_f1/pages_hostel/constants/constants.dart';

import '../../../../pages_booking/call.dart';
import '../../../../pages_booking/message.dart';

class BottomButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Message() ));},
            child: Container(
              width: size.width * 0.4,
              height: 60,
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(
                  color: darkBlue.withOpacity(0.6),
                  offset:const Offset(0,10),
                  blurRadius: 10,
                )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                 Icon((Icons.mail_rounded), color: white,),
                  Text('Message', style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Call()));},
            child: Container(
              width: size.width * 0.4,
              height: 60,
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(
                  color: darkBlue.withOpacity(0.6),
                  offset: const Offset(0,10),
                  blurRadius: 10,
                )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon((Icons.call_rounded), color: white,),
                  Text('Call', style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
