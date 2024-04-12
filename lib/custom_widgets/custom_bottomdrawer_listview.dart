import 'package:contacts/controllers/category_controller.dart';
import 'package:contacts/controllers/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Filter Drawer
class CustomBottomDrawerListView extends GetView<CategoryController> {
  CustomBottomDrawerListView({super.key});

  @override
  Widget build(BuildContext context) {
    final contactController = Get.put(ContactController());
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListTile(
            title: Text(controller.categories[index].categoryName.toString()),
            onTap: () {
              // ContactController().getContactsByCategory(
              //     controller.categories[index].categoryName.toString());

              contactController.getContactsByCategory(
                  controller.categories[index].categoryName!);
              Get.back();
            },
          ),
        );
      },
      itemCount: controller.categories.length,
    );
  }
}
