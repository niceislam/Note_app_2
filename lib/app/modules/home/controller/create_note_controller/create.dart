import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app/app/modules/home/controller/home_controller/controller.dart';

class CreateNoteController extends GetxController {
  RxInt characterCount = 0.obs;
  TextEditingController titlecrate = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  updateCharacter({required TextEditingController controllerfield}) {
    var a = controllerfield.text.length;
    characterCount.value = a;
  }

  backButton() {
    HomeController homeController = Get.put(HomeController());
    Map<String, dynamic> noteAdd = {
      "title": "${titlecrate.text}",
      "body": "${bodyController.text}",
      "time": "${DateFormat("MMMM dd  h:mm a").format(DateTime.now())}",
    };
    if (titlecrate.text != "" || bodyController.text != "") {
      homeController.NoteList.add(noteAdd);
      homeController.showData();
      bodyController.clear();
      titlecrate.clear();
      characterCount.value = 0;
    }

    log("================${homeController.NoteList.length}");
    log("================${homeController.NoteList}");
  }
}
