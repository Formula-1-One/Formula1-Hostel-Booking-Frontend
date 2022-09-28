import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostel_booking_app_ui_f1/pages_login/login_components/login_page.dart';

enum DialogAction{yes, cancel}

class AlertDialogs{
  static Future<DialogAction> yesCancelDialog(
      BuildContext context,
      String title,
      String body,
      )
  async{
    final action = await showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

          content:Text("Are you sure you want to log out? ", style:GoogleFonts.poppins(
          textStyle:
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),),
          actions: <Widget>[
            Row(
              children: [
                SizedBox(width: 120),
                GestureDetector(
                    onTap: () => {Navigator.of(context).pop(DialogAction.cancel)},
                    child:Text("CANCEL",style:GoogleFonts.poppins(
                     textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.red
                    ),),)
                ),
                SizedBox(width: 30,),
                GestureDetector(
                    onTap: () => {Navigator.of(context).pop(DialogAction.yes)},
                    child: InkWell(
                      onTap: (){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginPage()));},
                      child:Text("LOG OUT",style: GoogleFonts.poppins(
                        textStyle:
                      TextStyle(
                          fontSize: 15,
                          color: Colors.red
                      ),),)
                    ))
              ],
            ),

          ],
      );
        });
    return (action != null) ? action : DialogAction.cancel;
  }

}