import 'package:flutter/material.dart';

class Trash extends StatelessWidget {
  const Trash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Trash",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ],
    );
  }
}
