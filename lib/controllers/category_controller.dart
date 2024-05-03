import 'package:contacts/database/contacts_db.dart';
import 'package:contacts/models/Category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  var textController = TextEditingController();
  bool isEditMode = false;
  int editIndex = 0;
  var selectedValue = "".obs;
  int editCategoryId = 0;
  // var contactsDbObj;
  @override
  void onInit() {
    getAllCategories();
    super.onInit();

    // contactsDbObj = ContactsDatabase();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Delete Category
   */
  void deleteCategory(int index) {
    // HiveService().deleteCategoryAt(index);
    ContactsDatabase().deleteCategory(index);
    getAllCategories();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Add Category
   */
  void addCategory(String categoryName) {
    // HiveService().addCategory(categoryName);
    var category = Category(categoryName: categoryName);
    ContactsDatabase().insertCategory(category);
    getAllCategories();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Get Category by its ID
   */
  Future<String> getCategoryById(int categoryID) async {
    // HiveService().addCategory(categoryName);;
    String category = await ContactsDatabase().getCategoryById(categoryID);
    return category;
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Edit Category
   */
  void editCategory(String categoryName, int id) {
    // HiveService().editCategory(categoryName, editIndex);
    // ContactsDatabase.instance.editCategory()
    ContactsDatabase().editCategory(categoryName, id);
    getAllCategories();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Fetch All Categories
   */
  void getAllCategories() async {
    // categories.assignAll(HiveService().getAllCategories());
    var dbCategories = await ContactsDatabase().getCategories(); /**/

    categories.assignAll(dbCategories);
    categories.isNotEmpty
        ? selectedValue.value = categories[0].categoryName!
        : "";
    print("_________________");
    for (Category category in categories) {
      print(
          "ID : ${category.categoryId}  | Category : ${category.categoryName}");
    }
    update();
  }
}
