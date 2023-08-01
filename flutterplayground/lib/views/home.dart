import 'package:flutter/material.dart';
import 'package:flutterplayground/views/save_Button.dart';

import 'image_upload.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('H o m e'),
      ),
      body: const Column(
        children: [
          SaveButton(
            height: 60,
            width: 60,
          ),
          ImageUploadButton()
        ],
      ),
    );
  }
}
