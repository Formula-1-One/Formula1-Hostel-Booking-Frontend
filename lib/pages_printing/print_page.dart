
// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../pages_login/common_for_login/theme_helper.dart';



class PrintPage extends StatelessWidget {

 var  studentProfile;

  PrintPage ({required this.studentProfile,});

   Future<void> _createPdf() async {
    final doc = pw.Document();


    doc.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context){
            return pw.Center(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 30,),
                    pw.Text('Kindly come along with this\nform to the hostel',
                      style:  pw.TextStyle(fontSize: 35, fontWeight:  pw.FontWeight.bold),),
                    pw.SizedBox(height: 30,),
                    pw.Text('Name : ${studentProfile["first_name"]} ${studentProfile["last_name"]} ',
                      style:  pw.TextStyle( fontSize: 20),),
                    pw.SizedBox(height: 15,),
                    pw.Text('Reference Number: ${studentProfile["reference_number"]}', style:   pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Phone Number:  ${studentProfile["phone_number"]}', style:   pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Programme of study : ${studentProfile["program_of_study"]}', style:  pw.TextStyle( fontSize: 20)),
                  ]
              ),
            );
          }
      ),
    );


    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
    await Printing.sharePdf(bytes: await doc.save());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 80,
            left: 20,
          ),
          child: Row(
            children:  [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.arrow_back_rounded, color: Colors.black,),
                      ),
                    ),
                    const SizedBox(height: 30,),
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
                              child: Text('Print',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          onPressed: () => _createPdf(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



