import 'package:flutter/material.dart';
import 'package:flutterplayground/views/pdf.dart';
import 'package:flutterplayground/views/rating_container.dart';
import 'package:flutterplayground/views/sample.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'image_upload.dart';
import 'navbar.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  LatLng myLatLng = const LatLng(37.7749, -122.4194);

  Future<void> _showDateTimePickerDialog(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedStartTime = TimeOfDay.now();
    TimeOfDay selectedEndTime = TimeOfDay.now();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                'Scegli data e ora',
                style: TextStyle(
                  color: Color.fromARGB(255, 19, 16, 66),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Data',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    controller: TextEditingController(
                      text: "${selectedDate.toLocal()}".split(' ')[0],
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Starting time',
                      suffixIcon: Icon(Icons.access_time),
                    ),
                    readOnly: true,
                    controller: TextEditingController(
                      text: selectedStartTime.format(context),
                    ),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedStartTime,
                      );
                      if (pickedTime != null) {
                        setState(() {
                          selectedStartTime = pickedTime;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Ending time',
                      suffixIcon: Icon(Icons.access_time),
                    ),
                    readOnly: true,
                    controller: TextEditingController(
                      text: selectedEndTime.format(context),
                    ),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedEndTime,
                      );
                      if (pickedTime != null) {
                        setState(() {
                          selectedEndTime = pickedTime;
                        });
                      }
                    },
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Do something with selectedDate and selectedTime
                    print('Selected Date: $selectedDate');
                    print('Selected Time: $selectedStartTime');
                    print('Selected Time: $selectedEndTime');
                    Navigator.pop(context);
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('H o m e'),
      ),
      body: const Column(
        children: [
          SizedBox(height: 200, width: 300, child: PdfScreen())
          // SaveButton(
          //   height: 60,
          //   width: 60,
          // ),
          // ImageUploadButton(),
          // SizedBox(
          //   height: 50,
          // ),
          // const ImageUploadButton(
          //   userID: '1d75e822-bccb-432a-aedf-995239e46262',
          // ),
          // const MyWidget(),
          // ElevatedButton(
          //   onPressed: () {
          //     _showDateTimePickerDialog(context);
          //     // const Widget1();
          //   },
          //   child: const Text('Open Dialog'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => Widget2(
          //                 stopLoc: myLatLng,
          //               )),
          //     );
          //   },
          //   child: const Text('Go to New Page'),
          // )

          // Container(
          //     height: 80,
          //     width: 500,
          //     decoration: const BoxDecoration(color: Colors.white),
          //     child: const Row(
          //       children: [
          //         SizedBox(height: 80, width: 400, child: CustomNavbar())
          //       ],
          //     )),

          // const SizedBox(height: 100, width: 300, child: RatingContainer())
        ],
      ),
    );
  }
}
