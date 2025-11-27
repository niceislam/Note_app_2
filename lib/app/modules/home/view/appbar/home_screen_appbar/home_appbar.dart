import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:note_app/app/modules/home/controller/home_controller/controller.dart';
import 'package:note_app/app/modules/home/controller/trash_controller/trash_controller.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    TrashController controller = Get.put(TrashController());
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.grey.shade300,
      actions: [
        InkWell(
          onTap: () {
            log("==============${controller.TrashList.length}");
          },
          child: Icon(Icons.upload_file_outlined),
        ),
        SizedBox(width: 12),
        Icon(Icons.settings_outlined),
        SizedBox(width: 12),
      ],
    );
  }
}
