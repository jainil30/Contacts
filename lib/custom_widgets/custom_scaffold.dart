import 'package:contacts/controllers/contact_controller.dart';
import 'package:contacts/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/screens.dart';

//Custom Scaffold
class MyScaffold extends StatelessWidget {
  final Widget body;
  final bool hasDrawer;
  final String title;

  var controller = Get.put(ContactController());

  MyScaffold(
      {super.key,
      required this.body,
      this.hasDrawer = false,
      required this.title});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> screens = Screen.screens;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // endDrawer: Drawer(
      //   child: Column(
      //     children: [Text("asdfkjajfdk")],
      //   ),
      // ),
      drawer: hasDrawer
          ? Drawer(
              backgroundColor: const Color(0xff141414),
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          screens[index]["appBarTitle"],
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          DrawerListtileController.currentIndex.value = index;
                          print(DrawerListtileController.currentIndex.value);
                          // this.title
                          Get.back();
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: screens.length),
              ),
            )
          : null,
      appBar: AppBar(
        elevation: 3.0,
        centerTitle: true,
        title: Obx(
          () => Text(
            screens[DrawerListtileController.currentIndex.value]['appBarTitle'],
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        actions: [
          (DrawerListtileController.currentIndex.value == 2)
              ? IconButton(
                  onPressed: () {
                    print("Clear all");
                    controller.getAllContacts();
                    // ContactController().searchController.text = " ";
                    // ContactController().getAllContacts();
                    // ContactController().update();
                  },
                  icon: Icon(Icons.filter_alt_off))
              : SizedBox()
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child: screens[DrawerListtileController.currentIndex.value]['screen'],
        ),
      ),
    );
  }
}
