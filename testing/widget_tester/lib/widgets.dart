import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:widget_tester/testing.dart';

class widgetsTesdting extends StatefulWidget {
  const widgetsTesdting({super.key});

  @override
  State<widgetsTesdting> createState() => _widgetsTesdtingState();
}

class _widgetsTesdtingState extends State<widgetsTesdting> {
  LatLng myLatLng = const LatLng(37.7749, -122.4194);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Widget2(
                          stopLoc: myLatLng,
                        )),
              );
            },
            child: const Text('Click ME')),
      ),
    );
  }
}
