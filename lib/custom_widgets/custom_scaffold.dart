import 'package:contacts/controllers/contact_controller.dart';
import 'package:contacts/controllers/drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/screens.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final bool hasDrawer;
  final String title;

  const MyScaffold(
      {super.key,
      required this.body,
      this.hasDrawer = false,
      required this.title});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> screens = Screen.screens;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      endDrawer: Drawer(
        child: Column(
          children: [Text("asdfkjajfdk")],
        ),
      ),
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
                // child: Column(
                //   children: [
                //     ListTile(
                //       title: const CustomText(
                //           color: Colors.white, text: "Add Category"),
                //       onTap: () {
                //         // Get.to(const AddCategoryScreen());
                //         body = AddCategoryScreen();
                //       },
                //     ),
                //     const Divider(color: Color(0xff0b4e3d)),
                //     ListTile(
                //       title: const CustomText(
                //           color: Colors.white, text: "Add Contact"),
                //       onTap: () {
                //         // Get.to(const AddContactsScreen());
                //         body = AddContactsScreen();
                //       },
                //     ),
                //     const Divider(color: Color(0xff0b4e3d)),
                //     ListTile(
                //       title: const CustomText(
                //           color: Colors.white, text: "Add Category"),
                //       onTap: () {},
                //     ),
                //     const Divider(color: Color(0xff0b4e3d)),
                //   ],
                // ),
              ),
            )
          : null,
      appBar: AppBar(
        elevation: 3.0,
        centerTitle: true,
        actions: <Widget>[
          if (DrawerListtileController.currentIndex.value == 2)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(child: const Icon(Icons.filter_alt_rounded)),
            )
          else
            const SizedBox(),
          if (DrawerListtileController.currentIndex.value == 2)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: const Icon(Icons.search),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Search"),
                        actions: [
                          Form(
                              child: Column(
                            children: [
                              TextFormField(
                                autofillHints: ContactController()
                                    .contacts
                                    .value
                                    .map((e) => e.toString())
                                    .toList(),
                                decoration: const InputDecoration(
                                    hintText: "Search", labelText: "Search"),
                              )
                            ],
                          ))
                        ],
                      );
                    },
                  );
                },
              ),
            ),
        ],
        title: Obx(
          () => Text(
            screens[DrawerListtileController.currentIndex.value]['appBarTitle'],
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ),
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
