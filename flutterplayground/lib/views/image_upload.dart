// Automatic FlutterFlow imports
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase/supabase.dart';

final supabase = SupabaseClient(
  'https://lxthonooivjytwsbbpvp.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx4dGhvbm9vaXZqeXR3c2JicHZwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4NzUzNTk3MCwiZXhwIjoyMDAzMTExOTcwfQ.24jExdEZ4vI7HqHHaFDvDrK3Y3SWEwT7PNu2Xa-ROsE',
);

class ImageUploadButton extends StatefulWidget {
  const ImageUploadButton(
      {Key? key, this.width, this.height, required this.userID})
      : super(key: key);
  final double? width;
  final double? height;
  final String userID;

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
      // Upload image to Supabase storage
      final fileName = 'avatar_${widget.userID}.png';
      try {
        final response =
            await supabase.storage.from('avatars').upload(fileName, _image!);
        // Get public URL of uploaded image
        final publicUrl =
            supabase.storage.from('avatars').getPublicUrl(fileName);
        // Update avatar field in users table
        await supabase
            .from('users')
            .update({'avatar': publicUrl})
            .eq('id', widget.userID)
            .execute();
      } catch (e) {
        // Handle error
        print(e);
      }
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
