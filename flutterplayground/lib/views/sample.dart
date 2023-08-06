import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
            child: TextField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
            width: 3,
            color: Color.fromARGB(255, 19, 16, 66),
          ))),
        )),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send_rounded,
                  color: Color.fromARGB(255, 19, 16, 66),
                  size: 30,
                )),
          ),
        )
      ],
    );
  }
}
