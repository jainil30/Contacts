import 'package:contacts/controllers/category_controller.dart';
import 'package:contacts/custom_widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Custom Category Item
class CustomListviewItem extends GetView<CategoryController> {
  const CustomListviewItem({Key? key, required this.text, required this.index});

  final String? text;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CustomText(
              text: text ?? 'No text provided',
              color: const Color(0xffad802b),
              size: 20.0,
            ),
          )),
          SizedBox(
            width: 36,
            height: 36,
            child: IconButton(
              onPressed: () {
                Get.find<CategoryController>().textController.text =
                    controller.categories[index!].categoryName.toString();
                controller.isEditMode = true;

                controller.editIndex = index!;
                controller.editCategoryId =
                    controller.categories[index!].categoryId!.toInt();
                print(controller.editIndex);
              },
              icon: Image.asset('assets/images/edit.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 5),
            width: 36,
            height: 36,
            child: IconButton(
              onPressed: () {
                Get.snackbar(
                  "Deleted ",
                  "${controller.categories[index!].categoryName}",
                  icon: Icon(Icons.delete),
                  duration: Duration(seconds: 3),
                );

                print(
                    "Id : ${controller.categories[index!].categoryId.toString()}");
                controller.deleteCategory(
                    controller.categories[index!].categoryId!.toInt());
              },
              icon: Image.asset('assets/images/delete.png'),
            ),
          ),
        ],
      ),
    );
  }
}
