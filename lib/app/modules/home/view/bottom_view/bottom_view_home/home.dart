import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/app/data/dummy_data/Note_data/note_data.dart';
import 'package:note_app/app/data/model/Note_model/model.dart';
import 'package:note_app/app/modules/home/controller/home_controller/controller.dart';
import '../../../../../core/utils/widget/Custom_Textfield/TextField.dart';
import '../../screen/home_screen/widget/NoteCard/NoteCard.dart';
import 'package:get/get.dart';

class BottomHome extends StatelessWidget {
  const BottomHome({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Notes", style: TextStyle(color: Colors.black, fontSize: 40)),
        SizedBox(height: 10),
        CustomTextfield(
          onchanged: (value) {
            controller.searchFun(searchText: value);
          },
          hinttext: "Search here",
          preIcon: Icon(Icons.search_outlined, color: Colors.grey),
          filled: true,
          fillcolor: Colors.grey.withAlpha(320),
        ),
        SizedBox(height: 15),
        Obx(() {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.finalData.length,
            itemBuilder: (context, index) {
              NoteModel item = controller.finalData[index];
              return Dismissible(
                onDismissed: (dismiss) {
                  //NoteModel deleteItem = controller.finalData[index];
                  controller.NoteList.removeAt(index);
                  // controller.finalData.removeWhere(
                  //   (item) => item.time == deleteItem.time,
                  // );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red.shade200,
                      duration: Duration(seconds: 1),
                      content: Text(
                        "${index + 1} no Item Deleted",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                key: Key(item.title! + item.body! + item.time!),
                child: NoteCard(
                  title: item.title,
                  body: item.body,
                  time: item.time,
                ),
              );
            },
          );
        }),
      ],
    );
  }
}
