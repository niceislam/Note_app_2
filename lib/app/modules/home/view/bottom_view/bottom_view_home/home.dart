import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:note_app/app/data/model/Note_model/model.dart';
import 'package:note_app/app/modules/home/controller/home_controller/controller.dart';
import '../../../../../core/utils/widget/Custom_Textfield/TextField.dart';
import '../../screen/home_screen/widget/NoteCard/NoteCard.dart';
import 'package:get/get.dart';

class BottomHome extends StatelessWidget {
  const BottomHome({super.key});

  @override
  Widget build(BuildContext context) {
    log("==========================================================555");
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
                background: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.delete, color: Colors.white, size: 35),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                onDismissed: (dismiss) {
                  controller.ondismiss(
                    dissmiss: dismiss,
                    index: index,
                    context: context,
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
