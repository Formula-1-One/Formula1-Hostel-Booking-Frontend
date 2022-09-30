
// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';



class PrintPage extends StatelessWidget {

  late String firstName,lastName,gender,email, programme, phoneNumber, guardianName,
      guardianPhoneNumber, hostel, roomType;

  PrintPage ({required this.firstName, required this.lastName,required this.gender,
    required this.email, required this.programme, required this.phoneNumber,
    required this.guardianName,required this.guardianPhoneNumber,
    required this.hostel, required this.roomType,});

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
                      style:  pw.TextStyle(fontSize: 25, fontWeight:  pw.FontWeight.bold),),
                    pw.SizedBox(height: 15,),
                    pw.Text('First Name : ${firstName} ', style:  pw.TextStyle( fontSize: 20),),
                    pw.SizedBox(height: 15,),
                    pw.Text('Last Name(s) : ${lastName}', style:   pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Last Name(s) : ${gender}', style:   pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Email : ${email}', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Email : ${programme}', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Phone Number :  ${phoneNumber} ', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                   // pw.Text('Phone Number :  ${reference_number} ', style:  pw.TextStyle( fontSize: 20)),
                    //pw.SizedBox(height: 15,),
                    pw.Text('Guardian Name : ${guardianName}', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Guardian Phone Number : ${guardianPhoneNumber} ', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Selected Hostel : ${hostel}', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox( height: 15,),
                    pw.Text('Type of room : ${roomType}', style:  pw.TextStyle( fontSize: 20)),
                    //pw.SizedBox( height: 15,),
                    //pw.Text('Room id : ${room_type_id}', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox( height: 30,),
                    pw.Text('Make payment at ANY BRANCH OF GHANA COMMERCIAL BANK\n'
                            ' into this bank account (40100112309748).    ',
                      style:  pw.TextStyle(fontSize: 30, fontWeight:  pw.FontWeight.bold),),

                  ]
              ),
            );
          }
      ),
    );


    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
    await Printing.sharePdf(bytes: await doc.save(), filename: 'my_document.pdf');
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
                    const Text('Kindly come along with this\nform to the hostel',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    Text('First Name: ${firstName}', style: const TextStyle( fontSize: 20),),
                    const SizedBox(height: 20,),
                    Text('Last Name(s): ${lastName}', style: const TextStyle( fontSize: 20)),
                    const SizedBox(height: 20,),
                    Text('Last Name(s): ${gender}', style: const TextStyle( fontSize: 20)),
                    const SizedBox(height: 20,),
                    Text('Email: ${email}', style: const TextStyle( fontSize: 20)),
                    const SizedBox(height: 20,),
                    Text('Programme: ${programme}', style: const TextStyle( fontSize: 20)),
                    const SizedBox(height: 20,),
                    Text('Phone Number: ${phoneNumber}', style: const TextStyle( fontSize: 20)),
                    const SizedBox(height: 20,),
                    //Text('Phone Number: ${reference_number}', style: const TextStyle( fontSize: 20)),
                    //const SizedBox(height: 20,),
                    Text('Guardian Name: ${guardianName}', style: const TextStyle( fontSize: 20)),
                    const SizedBox(height: 20,),
                    Text('Guardian Phone Number: ${guardianPhoneNumber}', style: const TextStyle( fontSize: 20)),
                    const SizedBox(height: 20,),
                    Text('Selected Hostel: ${hostel}', style: const TextStyle( fontSize: 20)),
                    const SizedBox( height: 20,),
                    Text('Type of room: ${roomType}', style: const TextStyle( fontSize: 20)),
                    const SizedBox(height: 20,),
                    //Text('Room id: ${room_type_id}', style: const TextStyle( fontSize: 20)),
                    //const SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: ElevatedButton(
                        onPressed: () => _createPdf(),
                        child: const Text('CREATE & PRINT PDF'),
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



