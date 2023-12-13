import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'dart:typed_data';
import 'package:open_file/open_file.dart';

class completedRoute extends StatefulWidget {
  const completedRoute({super.key});

  @override
  _completedRouteState createState() => _completedRouteState();
}

class _completedRouteState extends State<completedRoute> {
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
                  child: pw.Text('Completed Route',
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
                          text: '     Driver: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text: 'David Warner',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                      pw.TextSpan(
                          text: '     \n\nVehicle ID: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text: '878349873',
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
                          text: 'Start Time: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text: '12/10/2023 @ 12:30 PM',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                      pw.TextSpan(
                          text: '     End Time: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text: '12/10/2023 @ 01:30 PM',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                      pw.TextSpan(
                          text: '     Duration: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text: '1:00 hour',
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                    ])),
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Container(
                    height: 150,
                    width: 500,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.blue100,
                      border: pw.Border.all(
                        color:
                            PdfColors.black, // Change the color of the border
                        width: 1, // Change the width of the border
                      ),
                    ),
                    child: pw.Text('Maps'),
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text('Completed Stops: ',
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
                    child: completedStopsVar,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text('Checked Out Riders: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Container(
                  height: 200,
                  width: 500,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                      color: PdfColors.black, // Change the color of the border
                      width: 1, // Change the width of the border
                    ),
                  ),
                  child: checkedOutRidersVar,
                ),
                pw.SizedBox(height: 20),
                pw.RichText(
                    text: pw.TextSpan(
                        style: const pw.TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                      pw.TextSpan(
                          text: 'Rider Conduct: ',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      const pw.TextSpan(
                          text:
                              "There are many variations of passages of Lorem Ipsum available.",
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline)),
                    ])),
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
                  pw.SizedBox(height: 20),
                  pw.Text('Rider Conduct Notes: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 10),
                  pw.Text(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. .",
                      style: const pw.TextStyle(
                          lineSpacing: 5,
                          decoration: pw.TextDecoration.underline)),
                  pw.SizedBox(height: 20),
                  pw.Text('Trip Notes: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 10),
                  pw.Text(
                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. .",
                      style: const pw.TextStyle(
                          lineSpacing: 5,
                          decoration: pw.TextDecoration.underline)),
                  pw.SizedBox(height: 20),
                  pw.Text('Driver Signature: ',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 10),
                  pw.Center(
                    child: pw.Container(
                        height: 150,
                        width: 500,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.blue100,
                          border: pw.Border.all(
                            color: PdfColors
                                .black, // Change the color of the border
                            width: 1, // Change the width of the border
                          ),
                        ),
                        child: pw.SizedBox(height: 20)),
                  ),
                ]),
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Table completedStopsVar = pw.Table(
    border: pw.TableBorder.all(color: PdfColors.black),
    children: List.generate(completedStops.length, (index) {
      return pw.TableRow(
        children: List.generate(completedStops[index].length, (index2) {
          return pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            child: pw.Text(
              completedStops[index][index2],
              style: const pw.TextStyle(fontSize: 12),
            ),
          );
        }),
      );
    }),
  );

  pw.Table checkedOutRidersVar = pw.Table(
    border: pw.TableBorder.all(color: PdfColors.black),
    children: List.generate(checkedOutRiders.length, (index) {
      return pw.TableRow(
        children: List.generate(checkedOutRiders[index].length, (index2) {
          return pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            child: pw.Text(
              checkedOutRiders[index][index2],
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
    return ElevatedButton(
      onPressed: () async {
        Uint8List newPdfBytes = await generatePDF();
        await _openFile(newPdfBytes);
      },
      child: const Text('Generate and Open PDF'),
    );
  }
}

List<List<String>> completedStops = [
  ['Stop Name', 'Time Completed', 'Time at Stop', 'Type'],
  ['A2', 'B2', 'C2', 'D2'],
  ['A3', 'B3', 'C3', 'D3'],
  ['A4', 'B4', 'C4', 'D4'],
  ['A5', 'B5', 'C5', 'D5'],
];

List<List<String>> checkedOutRiders = [
  ['A1', 'B1', 'C1', 'D1'],
  ['A2', 'B2', 'C2', 'D2'],
  ['A3', 'B3', 'C3', 'D3'],
  ['A4', 'B4', 'C4', 'D4'],
  ['A5', 'B5', 'C5', 'D5'],
];
