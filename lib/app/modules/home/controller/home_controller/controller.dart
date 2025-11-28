import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/model/Note_model/model.dart';
import 'package:note_app/app/modules/home/controller/trash_controller/trash_controller.dart';
import 'package:note_app/app/modules/home/view/appbar/home_screen_appbar/home_appbar.dart';
import 'package:note_app/app/modules/home/view/appbar/trash_appbar/trash_appbar.dart';
import '../../view/bottom_view/bottom_view_Trash/Trash.dart';
import '../../view/bottom_view/bottom_view_home/home.dart';

class HomeController extends GetxController {
  RxInt bottomIndex = 0.obs;
  List NoteList = [];
  RxList<NoteModel> originalData = <NoteModel>[].obs;
  RxList<NoteModel> searchData = <NoteModel>[].obs;
  RxList bottomPage = [BottomHome(), Trash()].obs;
  RxList BottomAppbar = [HomeAppbar(), TrashAppbar()].obs;

  bottomTap({required int index}) {
    bottomIndex.value = index;
  }

  showData() {
    originalData.clear();
    for (var i in NoteList) {
      dynamic ModelData = NoteModel.fromJson(i);
      originalData.add(ModelData);
    }
    searchData.assignAll(originalData);
  }

  ItemSearchFun({required String onchanged}) {
    if (onchanged.isNotEmpty) {
      List<NoteModel> searchText = originalData
          .where(
            (v) =>
                v.title!.toLowerCase().contains(onchanged.toLowerCase()) ||
                v.body!.toLowerCase().contains(onchanged.toLowerCase()),
          )
          .toList();

      searchData.assignAll(searchText);
    } else {
      log("=============////${searchData.length}");
      log("=============////${originalData.length}");
      searchData.assignAll(originalData);
    }
  }
  // searchFun({required String searchText}) {
  //   if (searchText != "") {
  //     List<NoteModel> searchValue = searchData
  //         .where(
  //           (v) =>
  //               v.title!.toLowerCase().contains(searchText.toLowerCase()) ||
  //               v.body!.toLowerCase().contains(searchText.toLowerCase()),
  //         )
  //         .toList();
  //     finalData.value = searchValue;
  //   } else {
  //     finalData.clear();
  //     log("=============////${searchData.length}");
  //     log("=============////${finalData.length}");
  //     finalData.value = searchData;
  //   }
  // }

  ondismiss({
    required dynamic dissmiss,
    required int index,
    required dynamic context,
  }) {
    TrashController controller = Get.put(TrashController());
    controller.TrashList.add(NoteList[index]);
    originalData.removeAt(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.shade200,
        duration: Duration(seconds: 2),
        content: Text(
          "${index + 1} no Item Deleted",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void onInit() {
    showData();
    super.onInit();
  }
}
