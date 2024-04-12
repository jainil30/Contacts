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

  /*
    Created by: Jainil Dalwadi
    Purpose : To Delete Category
   */
  void deleteCategory(int index) {
    HiveService().deleteCategoryAt(index);
    getAllCategories();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Add Category
   */
  void addCategory(String categoryName) {
    HiveService().addCategory(categoryName);
    getAllCategories();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Edit Category
   */
  void editCategory(String categoryName) {
    HiveService().editCategory(categoryName, editIndex);
    getAllCategories();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Fetch All Categories
   */
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
