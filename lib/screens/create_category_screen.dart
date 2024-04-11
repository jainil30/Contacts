import 'package:contacts/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/custome_text.dart';
import '../custom_widgets/listview_item.dart';

class AddCategoryScreen extends GetView<CategoryController> {
  AddCategoryScreen({Key? key}) : super(key: key);

  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: Get.find<CategoryController>().textController,
                decoration: InputDecoration(hintText: "Add Category"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Category is empty";
                  }
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    child: CustomText(
                      text: "Save",
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: const BeveledRectangleBorder(),
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(Get.find<CategoryController>()
                            .textController
                            .text
                            .toString());

                        if (controller.isEditMode) {
                          print("If --> Edit mode");
                          Get.find<CategoryController>().editCategory(
                              Get.find<CategoryController>()
                                  .textController
                                  .text
                                  .toString());
                          Get.find<CategoryController>().textController.text =
                              "";
                          controller.isEditMode = false;
                        } else {
                          print("Else --> Edit mode");
                          Get.find<CategoryController>().addCategory(
                              Get.find<CategoryController>()
                                  .textController
                                  .text
                                  .toString());
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 300,
          color: Color(0xffffe1bb),
          child: Obx(() {
            return ListView.separated(
              itemBuilder: (context, index) {
                return CustomListviewItem(
                  index: index,
                  text: Get.find<CategoryController>()
                      .categories[index]
                      .categoryName,
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: Get.find<CategoryController>()
                  .categories
                  .length, // Use controller.categories.length
            );
          }),
        ),
      ],
    );
  }
}
