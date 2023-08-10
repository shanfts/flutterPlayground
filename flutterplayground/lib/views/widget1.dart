// // Imports custom functions
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // Begin custom widget code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:mapbox_gl/mapbox_gl.dart' as map;

// class Widget2 extends StatefulWidget {
//   final double? width;
//   final double? height;
//   final LatLng stopLoc;

//   const Widget2({
//     Key? key,
//     this.width,
//     this.height,
//     required this.stopLoc,
//   }) : super(key: key);

//   @override
//   _Widget2State createState() => _Widget2State();
// }

// class _Widget2State extends State<Widget2> {
//   map.MapboxMapController? _controller;

//   @override
//   Widget build(BuildContext context) {
//     final location =
//         map.LatLng(widget.stopLoc.latitude, widget.stopLoc.longitude);
//     return Container(
//       child: map.MapboxMap(
//         accessToken:
//             '<pk.eyJ1IjoiYnVzYnVkZHkiLCJhIjoiY2xrcHpobHprMGpqejNvbThlMjdyeWFlayJ9.JhryJFqQss2z99eVqKyBRA>',
//         initialCameraPosition: map.CameraPosition(
//           target: location,
//           zoom: 11.0,
//         ),
//         onMapCreated: (map.MapboxMapController controller) {
//           _controller = controller;
//           _controller!.addSymbol(map.SymbolOptions(
//             geometry: location,
//             iconImage: 'airport-15',
//           ));
//         },
//       ),
//     );
//   }
// }
