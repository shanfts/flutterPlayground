import 'package:flutter/material.dart';

class InsertCoachButton extends StatefulWidget {
  const InsertCoachButton({Key? key, this.width, this.height})
      : super(key: key);
  final double? width;
  final double? height;

  @override
  State<InsertCoachButton> createState() => _InsertCoachButtonState();
}

class _InsertCoachButtonState extends State<InsertCoachButton> {
  bool isCoach = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isCoach == true
          ? const SizedBox(
              height: 5,
            )
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_add,
                color: Color.fromARGB(255, 19, 16, 66),
              )),
    );
  }
}
