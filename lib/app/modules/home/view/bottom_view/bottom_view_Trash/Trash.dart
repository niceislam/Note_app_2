import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/modules/home/controller/home_controller/controller.dart';
import 'package:note_app/app/modules/home/controller/trash_controller/trash_controller.dart';
import 'package:note_app/app/modules/home/view/screen/home_screen/widget/NoteCard/NoteCard.dart';
import '../../../../../core/utils/widget/Custom_Textfield/TextField.dart';

class Trash extends StatelessWidget {
  const Trash({super.key});

  @override
  Widget build(BuildContext context) {
    TrashController controller = Get.put(TrashController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextfield(
          onchanged: (value) {
            // controller.searchFun(searchText: value);
          },
          hinttext: "Search here",
          preIcon: Icon(Icons.search_outlined, color: Colors.grey),
          filled: true,
          fillcolor: Colors.grey.withAlpha(320),
        ),
        SizedBox(height: 15),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.TrashList.length,
            itemBuilder: (context, index) {
              final item = controller.TrashList[index];
              return Dismissible(
                onDismissed: (dismiss) {
                  controller.ondismiss(
                    dismiss: dismiss,
                    index: index,
                    context: context,
                  );
                },
                background: Container(
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.restore, color: Colors.white, size: 35),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                key: Key(item['title'] + item['body'] + item['time']),
                child: NoteCard(
                  title: item['title'],
                  body: item['body'],
                  time: item['time'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
