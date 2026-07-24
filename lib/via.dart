import 'package:flutter/material.dart';

class Via extends StatelessWidget {
  final IconData icon1;
  final String name1;
  const Via({super.key, required this.icon1, required this.name1});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
          elevation: 3,
          child: Container(
            height: 90,
            width: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 232, 232, 229),
            ),
            child: Column(
              children: [
                IconButton(onPressed: () {}, icon: Icon(icon1, size: 50)),
                Text(name1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
