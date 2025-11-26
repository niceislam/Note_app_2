import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:note_app/app/core/utils/widget/Custom_Textfield/TextField.dart';
import 'package:note_app/app/modules/home/controller/create_note_controller/create.dart';
import 'package:get/get.dart';

class NoteCreate extends StatelessWidget {
  const NoteCreate({super.key});

  @override
  Widget build(BuildContext context) {
    CreateNoteController controller = Get.put(CreateNoteController());
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            await controller.backButton();
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.grey.shade300,
        actions: [
          Obx(
            () => controller.characterCount != 0
                ? InkWell(
                    onTap: () async {
                      await controller.backButton();
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.check),
                    ),
                  )
                : Row(
                    children: [
                      Icon(Icons.chat_outlined),
                      SizedBox(width: 10),
                      Icon(Icons.more_vert),
                    ],
                  ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(
              maxline: 1,
              onchanged: (v) {
                controller.updateCharacter(
                  controllerfield: controller.titlecrate,
                );
              },
              controller: controller.titlecrate,
              cursorHeight: 22,
              InTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              hinttext: "Title",
              hintStyle: TextStyle(fontSize: 22, color: Colors.grey.shade500),
            ),
            Row(
              spacing: 5,
              children: [
                Text(
                  " ${DateFormat("MMMM dd  h:mm a").format(DateTime.now())}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Obx(
                  () => Text(
                    "|  ${controller.characterCount}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  "character",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            CustomTextfield(
              hinttext: "Start Typing",
              hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
              maxline: 5,
              controller: controller.bodyController,
            ),
          ],
        ),
      ),
    );
  }
}
