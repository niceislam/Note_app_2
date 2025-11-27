import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:note_app/app/modules/home/controller/home_controller/controller.dart';
import 'package:get/get.dart';
import 'package:note_app/app/modules/home/view/screen/Note_create/create.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(49),
        child: Obx(() => controller.BottomAppbar[controller.bottomIndex.value]),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: SingleChildScrollView(
          child: Obx(() => controller.bottomPage[controller.bottomIndex.value]),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (value) {
            controller.bottomTap(index: value);
          },
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Colors.grey.shade300,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.bottomIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: "Notes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_delete),
              label: "Trash",
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => controller.bottomIndex == 0
            ? InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => NoteCreate()),
                  );
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),

                  child: Center(
                    child: Icon(Icons.add, size: 35, color: Colors.white),
                  ),
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
