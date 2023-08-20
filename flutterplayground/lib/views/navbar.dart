import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({Key? key, this.height, this.width}) : super(key: key);
  final double? width;
  final double? height;

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int selectedIndex = 0; // Store the index of the selected container

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index; // Update the selected index
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? const Color.fromARGB(100, 21, 19, 66)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      size: 25,
                      color: selectedIndex == index
                          ? const Color.fromARGB(255, 19, 16, 66)
                          : Colors.grey,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: selectedIndex == index
                            ? const Color.fromARGB(255, 19, 16, 66)
                            : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
