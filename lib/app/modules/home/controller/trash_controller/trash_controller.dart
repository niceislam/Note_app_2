import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/modules/home/controller/home_controller/controller.dart';

class TrashController extends GetxController {
  RxList TrashList = [].obs;

  ondismiss({
    required dynamic dismiss,
    required int index,
    required dynamic context,
  }) {
    HomeController controller = Get.put(HomeController());
    controller.NoteList.add(TrashList[index]);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green.shade200,
        content: Text("${index + 1} no item restored"),
      ),
    );
  }
}
