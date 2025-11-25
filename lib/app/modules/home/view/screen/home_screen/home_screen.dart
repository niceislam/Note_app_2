import 'package:flutter/material.dart';
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
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.grey.shade300,
        actions: [
          Icon(Icons.upload_file_outlined),
          SizedBox(width: 12),
          Icon(Icons.settings_outlined),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
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
      floatingActionButton: InkWell(
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

          child: Center(child: Icon(Icons.add, size: 35, color: Colors.white)),
        ),
      ),
    );
  }
}
