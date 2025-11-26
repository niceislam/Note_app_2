import 'dart:developer';
import 'package:get/get.dart';
import 'package:note_app/app/data/model/Note_model/model.dart';
import 'package:note_app/app/modules/home/view/bottom_view/bottom_view_Task/Trash.dart';
import '../../view/bottom_view/bottom_view_home/home.dart';

class HomeController extends GetxController {
  RxInt bottomIndex = 0.obs;
  List NoteList = [];
  List TrashList = [];
  RxList<NoteModel> searchData = <NoteModel>[].obs;
  RxList<NoteModel> finalData = <NoteModel>[].obs;
  RxList bottomPage = [BottomHome(), Trash()].obs;

  bottomTap({required int index}) {
    bottomIndex.value = index;
  }

  showData() async {
    finalData.clear();
    for (var i in NoteList) {
      dynamic ModelData = NoteModel.fromJson(i);
      searchData.add(ModelData);
    }
    finalData = searchData;
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
      log("=============////${searchData.length}");
      log("=============////${finalData.length}");
      finalData = searchData;
    }
  }

  @override
  void onInit() {
    log("==============88888888");
    showData();
    super.onInit();
  }
}
