import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';

class tripRequest extends StatefulWidget {
  const tripRequest({super.key});

  @override
  _tripRequestState createState() => _tripRequestState();
}

class _tripRequestState extends State<tripRequest> {
  late Future<Uint8List> pdfFuture;

  Future<Uint8List> generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(50),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text('Trip Requested',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold)),
                ),
                pw.SizedBox(height: 30),
                pw.RichText(
                    text: pw.TextSpan(
                        style: const pw.TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                      pw.TextSpan(
                          text: 'Date: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text: '12/10/2023 @ 12:30 PM',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                      pw.TextSpan(
                          text: '     Departure Time: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text: '12/10/2023 @ 12:30 PM',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                      pw.TextSpan(
                          text: '       \n\nReturn Time: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text: '12/10/2023 @ 12:30 PM',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                    ])),
                pw.SizedBox(height: 20),
                pw.RichText(
                    text: pw.TextSpan(
                        style: const pw.TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                      pw.TextSpan(
                          text: 'Requested By: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text: 'David Warner',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                    ])),
                pw.SizedBox(height: 20),
                pw.Text('Details: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Text(
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                    style: const pw.TextStyle(
                        lineSpacing: 5,
                        decoration: pw.TextDecoration.underline)),
                pw.SizedBox(height: 20),
                pw.RichText(
                    text: pw.TextSpan(
                        style: const pw.TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                      pw.TextSpan(
                          text: 'Origin: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text:
                              'There are many variations of passages of Lorem Ipsum available',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                    ])),
                pw.SizedBox(height: 20),
                pw.Text('Origin Notes: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Text(
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum.There are many variations of passages of Lorem Ipsum available.",
                    style: const pw.TextStyle(
                        lineSpacing: 5,
                        decoration: pw.TextDecoration.underline)),
                pw.SizedBox(height: 20),
                pw.RichText(
                    text: pw.TextSpan(
                        style: const pw.TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                      pw.TextSpan(
                          text: 'Destination: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text:
                              'There are many variations of passages of Lorem Ipsum available',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                    ])),
                pw.SizedBox(height: 20),
                pw.Text('Destination Notes: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Text(
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum.There are many variations of passages of Lorem Ipsum available.",
                    style: const pw.TextStyle(
                        lineSpacing: 5,
                        decoration: pw.TextDecoration.underline)),
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Container(
                    height: 120,
                    width: 500,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.blue100,
                      border: pw.Border.all(
                        color:
                            PdfColors.black, // Change the color of the border
                        width: 1, // Change the width of the border
                      ),
                    ),
                    child: pw.Text(
                        'Map with polyline from "origin" to "destination"'),
                  ),
                ),
              ]);
        },
      ),
    );

    // Second Page
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Student Riders: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 10),
                  pw.Center(
                    child: pw.Container(
                      height: 200,
                      width: 500,
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(
                          color:
                              PdfColors.black, // Change the color of the border
                          width: 1, // Change the width of the border
                        ),
                      ),
                      child: studentRidersTableVar,
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Text('Faculty: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    height: 200,
                    width: 500,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color:
                            PdfColors.black, // Change the color of the border
                        width: 1, // Change the width of the border
                      ),
                    ),
                    child: facultyTableVar,
                  ),
                  pw.SizedBox(height: 20),
                  pw.Text('Groups: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    height: 200,
                    width: 500,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color:
                            PdfColors.black, // Change the color of the border
                        width: 1, // Change the width of the border
                      ),
                    ),
                    child: groupsTableVar,
                  ),
                  pw.SizedBox(height: 20),
                  pw.Container(
                    height: 200,
                    width: 500,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color:
                            PdfColors.black, // Change the color of the border
                        width: 1, // Change the width of the border
                      ),
                    ),
                    child: calculationTableVar,
                  ),
                  pw.SizedBox(height: 20),
                  pw.RichText(
                      text: pw.TextSpan(
                          style: const pw.TextStyle(
                            fontSize: 14,
                          ),
                          children: [
                        pw.TextSpan(
                            text: 'Total Cost: ',
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        const pw.TextSpan(
                            text: "\$1037",
                            style: pw.TextStyle(
                                decoration: pw.TextDecoration.underline)),
                      ])),
                  // pw.SizedBox(height: 20),
                  // pw.RichText(
                  //     text: pw.TextSpan(
                  //         style: const pw.TextStyle(
                  //           fontSize: 14,
                  //         ),
                  //         children: [
                  //       pw.TextSpan(
                  //           text: 'Rider Conduct: ',
                  //           style:
                  //               pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  //       const pw.TextSpan(
                  //           text:
                  //               "There are many variations of passages of Lorem Ipsum available.",
                  //           style: pw.TextStyle(
                  //               decoration: pw.TextDecoration.underline)),
                  //     ])),
                  // pw.SizedBox(height: 20),
                  // pw.Text('Rider Conduct Notes: ',
                  //     style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  // pw.SizedBox(height: 10),
                  // pw.Text(
                  //     "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. .",
                  //     style: const pw.TextStyle(
                  //         lineSpacing: 5,
                  //         decoration: pw.TextDecoration.underline)),
                  // pw.SizedBox(height: 20),
                  // pw.Text('Trip Notes: ',
                  //     style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  // pw.SizedBox(height: 10),
                  // pw.Text(
                  //     "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. .",
                  //     style: const pw.TextStyle(
                  //         lineSpacing: 5,
                  //         decoration: pw.TextDecoration.underline)),
                  // pw.SizedBox(height: 20),
                ]),
          );
        },
      ),
    );
    //!Third Page
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Approved In App By: ',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 20),
            pw.RichText(
                text: pw.TextSpan(
                    style: const pw.TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                  pw.TextSpan(
                      text: 'Name: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: "Katte Mal",
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                ])),
            pw.SizedBox(height: 10),
            pw.Center(
              child: pw.Container(
                  height: 150,
                  width: 500,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.blue100,
                    border: pw.Border.all(
                      color: PdfColors.black, // Change the color of the border
                      width: 1, // Change the width of the border
                    ),
                  ),
                  child: pw.SizedBox(height: 20)),
            ),
            pw.SizedBox(height: 30),
            pw.Text('Written Approval: ',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.RichText(
                text: pw.TextSpan(
                    style: const pw.TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                  pw.TextSpan(
                      text: 'Name: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: 'Alex butt',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                  pw.TextSpan(
                      text: '     Role: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: 'CEO',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                ])),
            pw.SizedBox(height: 20),
            pw.RichText(
                text: pw.TextSpan(
                    style: const pw.TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                  pw.TextSpan(
                      text: 'Signature: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: "________________________________________________",
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                ])),
            pw.SizedBox(height: 50),
            pw.RichText(
                text: pw.TextSpan(
                    style: const pw.TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                  pw.TextSpan(
                      text: 'Name: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: 'Alex butt',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                  pw.TextSpan(
                      text: '     Role: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: 'CEO',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                ])),
            pw.SizedBox(height: 20),
            pw.RichText(
                text: pw.TextSpan(
                    style: const pw.TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                  pw.TextSpan(
                      text: 'Signature: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: "________________________________________________",
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                ])),
            pw.SizedBox(height: 50),
            pw.RichText(
                text: pw.TextSpan(
                    style: const pw.TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                  pw.TextSpan(
                      text: 'Name: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: 'Alex butt',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                  pw.TextSpan(
                      text: '     Role: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: 'CEO',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                ])),
            pw.SizedBox(height: 20),
            pw.RichText(
                text: pw.TextSpan(
                    style: const pw.TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                  pw.TextSpan(
                      text: 'Signature: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: "________________________________________________",
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                ])),
            pw.SizedBox(height: 50),
            pw.RichText(
                text: pw.TextSpan(
                    style: const pw.TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                  pw.TextSpan(
                      text: 'Name: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: 'Alex butt',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                  pw.TextSpan(
                      text: '     Role: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: 'CEO',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                ])),
            pw.SizedBox(height: 20),
            pw.RichText(
                text: pw.TextSpan(
                    style: const pw.TextStyle(
                      fontSize: 14,
                    ),
                    children: [
                  pw.TextSpan(
                      text: 'Signature: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  const pw.TextSpan(
                      text: "________________________________________________",
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline)),
                ])),
          ],
        );
      },
    ));

    return pdf.save();
  }

  pw.Table studentRidersTableVar = pw.Table(
    border: pw.TableBorder.all(color: PdfColors.black),
    children: List.generate(studentRidersTable.length, (index) {
      return pw.TableRow(
        children: List.generate(studentRidersTable[index].length, (index2) {
          return pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            child: pw.Text(
              studentRidersTable[index][index2],
              style: const pw.TextStyle(fontSize: 12),
            ),
          );
        }),
      );
    }),
  );

  pw.Table facultyTableVar = pw.Table(
    border: pw.TableBorder.all(color: PdfColors.black),
    children: List.generate(facultyTable.length, (index) {
      return pw.TableRow(
        children: List.generate(facultyTable[index].length, (index2) {
          return pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            child: pw.Text(
              facultyTable[index][index2],
              style: const pw.TextStyle(fontSize: 12),
            ),
          );
        }),
      );
    }),
  );
  pw.Table groupsTableVar = pw.Table(
    border: pw.TableBorder.all(color: PdfColors.black),
    children: List.generate(groupsTable.length, (index) {
      return pw.TableRow(
        children: List.generate(groupsTable[index].length, (index2) {
          return pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            child: pw.Text(
              groupsTable[index][index2],
              style: const pw.TextStyle(fontSize: 12),
            ),
          );
        }),
      );
    }),
  );
  pw.Table calculationTableVar = pw.Table(
    border: pw.TableBorder.all(color: PdfColors.black),
    children: List.generate(calculationTable.length, (index) {
      return pw.TableRow(
        children: List.generate(calculationTable[index].length, (index2) {
          return pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            child: pw.Text(
              calculationTable[index][index2],
              style: const pw.TextStyle(fontSize: 12),
            ),
          );
        }),
      );
    }),
  );
  Future<File> _createFile(Uint8List bytes) async {
    final directory = (await getExternalStorageDirectory())!.path;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final file = File('$directory/example_$timestamp.pdf');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<void> _openFile(Uint8List bytes) async {
    File file = await _createFile(bytes);
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Uint8List newPdfBytes = await generatePDF();
            await _openFile(newPdfBytes);
          },
          child: const Text('Generate and Open PDF'),
        ),
      ),
    );
  }
}

List<List<String>> studentRidersTable = [
  ['A1', 'B1', 'C1', 'D1'],
  ['A2', 'B2', 'C2', 'D2'],
  ['A3', 'B3', 'C3', 'D3'],
  ['A4', 'B4', 'C4', 'D4'],
  ['A5', 'B5', 'C5', 'D5'],
];

List<List<String>> facultyTable = [
  ['display_name', 'B1', 'C1', 'D1'],
  ['A2', 'B2', 'C2', 'D2'],
  ['A3', 'B3', 'C3', 'D3'],
  ['A4', 'B4', 'C4', 'D4'],
  ['A5', 'B5', 'C5', 'D5'],
];

List<List<String>> groupsTable = [
  ['name', 'B1', 'C1', 'D1'],
  ['name', 'B2', 'C2', 'D2'],
  ['name', 'B3', 'C3', 'D3'],
  ['name', 'B4', 'C4', 'D4'],
  ['name', 'B5', 'C5', 'D5'],
];

List<List<String>> calculationTable = [
  ['Cost Item', 'Quantity', 'Cost(\$)', 'Total'],
  ['title', 'quantity', 'cost', 'total'],
  ['A3', 'B3', 'C3', 'D3'],
  ['A4', 'B4', 'C4', 'D4'],
  ['A5', 'B5', 'C5', 'D5'],
];
