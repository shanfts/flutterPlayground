import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadButton extends StatefulWidget {
  const ImageUploadButton({Key? key, this.width, this.height})
      : super(key: key);
  final double? width;
  final double? height;

  @override
  _ImageUploadButtonState createState() => _ImageUploadButtonState();
}

class _ImageUploadButtonState extends State<ImageUploadButton> {
  File? _image;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: IconButton(
        onPressed: _pickImage,
        icon: const Icon(
          Icons.add_a_photo,
          color: Color.fromARGB(255, 19, 16, 66),
        ),
      ),
    );
  }
}
