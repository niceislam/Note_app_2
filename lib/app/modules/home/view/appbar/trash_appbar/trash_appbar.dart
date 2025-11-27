import 'package:flutter/material.dart';

class TrashAppbar extends StatelessWidget {
  const TrashAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Icon(Icons.upload_file_outlined),
        SizedBox(width: 12),
        Icon(Icons.settings_outlined),
        SizedBox(width: 12),
      ],
      backgroundColor: Colors.grey.shade300,
      centerTitle: true,
      title: Text(
        "Trash",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
