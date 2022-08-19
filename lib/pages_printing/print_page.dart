
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';



class PrintPage extends StatelessWidget {

  late String surName,otherName,email,phoneNumber,guardianName,address,guardianPhoneNumber, hostel;

  PrintPage ({required this.surName, required this.otherName,
    required this.email,required this.phoneNumber,
    required this.guardianName,required this.address,required this.guardianPhoneNumber,
    required this.hostel});

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
                    pw.Text('Name : ${surName} ', style:  pw.TextStyle( fontSize: 20),),
                    pw.SizedBox(height: 15,),
                    pw.Text('Last Name(s) : ${otherName}', style:   pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Email : ${email}', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Phone Number :  ${phoneNumber} ', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Guardian Name : ${guardianName}', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Guardian Address : ${address}', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Guardian Phone Number : ${guardianPhoneNumber} ', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox(height: 15,),
                    pw.Text('Selected Hostel : ${hostel}', style:  pw.TextStyle( fontSize: 20)),
                    pw.SizedBox( height: 50,),
                    pw.Text('Formula One Hostel Booking ', style:  pw.TextStyle(fontSize: 20, fontWeight:  pw.FontWeight.bold),),

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
      body: Container(
        padding: const EdgeInsets.only(
          top: 80,
          left: 20,
        ),
        child: Row(
          children:  [
            Column(
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
                const SizedBox(height: 25,),
                Text('Name: ${surName}', style: const TextStyle( fontSize: 20),),
                const SizedBox(height: 25,),
                Text('Last Name(s): ${otherName}', style: const TextStyle( fontSize: 20)),
                const SizedBox(height: 25,),
                Text('Email: ${email}', style: const TextStyle( fontSize: 20)),
                const SizedBox(height: 25,),
                Text('Phone Number: ${phoneNumber}', style: const TextStyle( fontSize: 20)),
                const SizedBox(height: 25,),
                Text('Guardian Name: ${guardianName}', style: const TextStyle( fontSize: 20)),
                const SizedBox(height: 25,),
                Text('Guardian Address: ${address}', style: const TextStyle( fontSize: 20)),
                const SizedBox(height: 25,),
                Text('Guardian Phone Number: ${guardianPhoneNumber}', style: const TextStyle( fontSize: 20)),
                const SizedBox(height: 25,),
                Text('Selected Hostel: ${hostel}', style: const TextStyle( fontSize: 20)),
                const SizedBox( height: 50,),
                const Text('Formula One Hostel Booking '),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 85),
                  child: ElevatedButton(
                    onPressed: () => _createPdf(),
                    child: const Text('CREATE & PRINT PDF'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


