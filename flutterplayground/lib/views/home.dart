import 'package:flutter/material.dart';
import 'package:flutterplayground/views/sample.dart';
import 'package:flutterplayground/views/widget1.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  LatLng myLatLng = const LatLng(37.7749, -122.4194);
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
          // SaveButton(
          //   height: 60,
          //   width: 60,
          // ),
          // ImageUploadButton(),
          // SizedBox(
          //   height: 50,
          // ),
          MyWidget(),
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
        ],
      ),
    );
  }
}
