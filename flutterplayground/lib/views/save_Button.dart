import 'package:flutter/material.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({Key? key, this.width, this.height}) : super(key: key);
  final double? width;
  final double? height;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, // Change color based on isSaved state
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: const Color.fromARGB(255, 19, 16, 66), width: 1.5)),
      child: IconButton(
        color: const Color.fromARGB(255, 19, 16, 66),
        onPressed: () {
          setState(() {
            isSaved = !isSaved; // Toggle the state on button press
          });
        },
        icon: Icon(
          isSaved
              ? Icons.bookmark
              : Icons.bookmark_border, // Change icon based on isSaved state
        ),
      ),
    );
  }
}

// await SavedTable().insert({
//           'id_users' = currentUserUid,
//           'id_coach_sheet' = rowCoachSheetRow.id.toString(),
//         });