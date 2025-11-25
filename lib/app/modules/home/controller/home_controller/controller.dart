import 'dart:developer';

import 'package:get/get.dart';
import 'package:note_app/app/data/dummy_data/Note_data/note_data.dart';
import 'package:note_app/app/data/model/Note_model/model.dart';
import 'package:note_app/app/modules/home/view/bottom_view/bottom_view_Task/Trash.dart';
import '../../view/bottom_view/bottom_view_home/home.dart';

class HomeController extends GetxController {
  RxInt bottomIndex = 0.obs;
  RxList<NoteModel> searchData = <NoteModel>[].obs;
  RxList<NoteModel> finalData = <NoteModel>[].obs;
  RxList bottomPage = [BottomHome(), Trash()].obs;

  bottomTap({required int index}) {
    bottomIndex.value = index;
  }

  showData() async {
    for (var i in NoteData().Note) {
      dynamic ModelData = NoteModel.fromJson(i);
      searchData.add(ModelData);
    }
    finalData.assignAll(searchData);
  }

  searchFun({required String searchText}) {
    if (searchText != "") {
      List<NoteModel> searchValue = searchData
          .where(
            (v) => v.title!.toLowerCase().contains(searchText.toLowerCase()),
          )
          .toList();
      finalData.value = searchValue;
    } else {
      finalData.assignAll(searchData);
    }
  }

  @override
  void onInit() {
    showData();
    super.onInit();
  }
}
