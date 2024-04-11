import 'package:contacts/hive_service.dart';
import 'package:contacts/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  var textController = TextEditingController();
  bool isEditMode = false;
  int editIndex = 0;
  var selectedValue = "".obs;
  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }

  void deleteCategory(int index) {
    HiveService().deleteCategoryAt(index);
    getAllCategories();
  }

  void addCategory(String categoryName) {
    HiveService().addCategory(categoryName);
    getAllCategories();
  }

  void editCategory(String categoryName) {
    HiveService().editCategory(categoryName, editIndex);
    getAllCategories();
  }

  void getAllCategories() {
    categories.assignAll(HiveService().getAllCategories());
    categories.isNotEmpty
        ? selectedValue.value = categories[0].categoryName!
        : "";
    print("_________________");
    for (Category category in categories) {
      print(category.categoryName);
    }
    update();
  }
}
