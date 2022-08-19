import 'package:flutter/material.dart';
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Formula 1", style: TextStyle(
            fontSize: 20,
          ),),
          content: const Text("Are you sure you want to log out ? ", style: TextStyle(
            fontSize: 20,
          ),),
          actions: <Widget>[
            FlatButton(
                onPressed: () => {Navigator.of(context).pop(DialogAction.cancel)},
                child: const Text("Cancel",style: TextStyle(
                  fontSize: 20,
                ),)),
            FlatButton(
                onPressed: () => {Navigator.of(context).pop(DialogAction.yes)},
                child: InkWell(
                  onTap: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));},
                  child: const Text("Confirm",style: TextStyle(
                    fontSize: 20,
                    color: Colors.redAccent
                  ),),
                ))
          ],
      );
        });
    return (action != null) ? action : DialogAction.cancel;
  }

}