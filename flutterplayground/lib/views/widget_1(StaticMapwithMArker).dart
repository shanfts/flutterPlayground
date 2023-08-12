// Automatic FlutterFlow imports// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:typed_data';
import 'package:google_maps_flutter/google_maps_flutter.dart' as map;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class Widget1 extends StatefulWidget {
  final LatLng vehicleLocation;
  const Widget1({
    Key? key,
    this.width,
    this.height,
    required this.vehicleLocation,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _Widget1State createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
  final String jsonData = '''
  [
    {
        "featureType": "all",
        "elementType": "all",
        "stylers": [
            {
                "saturation": "100"
            },
            {
                "weight": "0.01"
            }
        ]
    },
    {
        "featureType": "administrative.country",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.province",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.locality",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.neighborhood",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.neighborhood",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.neighborhood",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative.land_parcel",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape.man_made",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape.natural",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#4285f4"
            },
            {
                "lightness": "85"
            }
        ]
    },
    {
        "featureType": "landscape.natural.landcover",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "landscape.natural.terrain",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.attraction",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.business",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.government",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.medical",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.place_of_worship",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.place_of_worship",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#ffeea9"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#faca00"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#4285f4"
            },
            {
                "weight": "4"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "labels.icon",
        "stylers": [
            {
                "color": "#4285f4"
            }
        ]
    },
    {
        "featureType": "poi.sports_complex",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#faca00"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#4258f4"
            },
            {
                "lightness": "22"
            },
            {
                "weight": "3"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "visibility": "on"
            },
            {
                "weight": "4"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "color": "#4258f4"
            },
            {
                "weight": "2"
            },
            {
                "lightness": "52"
            },
            {
                "saturation": "20"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.highway.controlled_access",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road.highway.controlled_access",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "weight": "3"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "visibility": "on"
            },
            {
                "weight": "2.5"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit.station",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#3fc6fd"
            },
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    }
]

  ''';
  map.BitmapDescriptor? _customIcon;
  late map.GoogleMapController mapController;
  map.Marker marker = const map.Marker(
    markerId: map.MarkerId('driver'),
  );

  @override
  void initState() {
    super.initState();
    _createMarkerImageFromUrl();
    // Set up a timer to fetch data every 10 seconds
  }

  Future<void> _createMarkerImageFromUrl() async {
    print('Creating marker image from URL...');
    final response = await http.get(Uri.parse(
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/bus-buddy-9ifad2/assets/s9q0x3wlz4m6/marker.png'));
    if (response.statusCode != 200) {
      print('Failed to load marker image from URL');
      return;
    }
    final Uint8List bytes = response.bodyBytes;
    final ui.Codec codec =
        await ui.instantiateImageCodec(bytes, targetWidth: 80);
    final ui.FrameInfo fi = await codec.getNextFrame();
    final ByteData? resizedBytes =
        await fi.image.toByteData(format: ui.ImageByteFormat.png);
    if (resizedBytes == null) {
      print('Failed to resize marker image');
      return;
    }
    setState(() {
      _customIcon =
          map.BitmapDescriptor.fromBytes(resizedBytes.buffer.asUint8List());
      marker = map.Marker(
        markerId: const map.MarkerId('driver'),
        position: widget.vehicleLocation,
        icon: _customIcon!,
      );
    });
    print('Marker image created successfully!');
  }

  void _onMapCreated(map.GoogleMapController controller) {
    mapController = controller;
    if (jsonData.isNotEmpty) {
      mapController.setMapStyle(jsonData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: map.GoogleMap(
      onMapCreated: _onMapCreated,
      markers: {marker},
      initialCameraPosition: map.CameraPosition(
        target: widget.vehicleLocation,
        zoom: 15,
      ),
    ));
  }
}
