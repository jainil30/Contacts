import 'package:contacts/models/category.dart' as Category;
import 'package:contacts/models/contact.dart';

import 'Utils/boxes.dart';

class HiveService {
  static const String _categoryBoxName = 'category';
  final box = Boxes.getCategories();
  final contactBox = Boxes.getContacts();

  void addCategory(String categoryName) {
    // final box = Hive.box<Category>(_categoryBoxName);
    final newCategory = Category.Category(categoryName: categoryName);
    box.add(newCategory);
  }

  List<Category.Category> getAllCategories() {
    return box.values.toList();
  }

  void deleteCategoryAt(int index) {
    box.deleteAt(index);
  }

  void addContact(String firstName, String lastName, num mobileNumber,
      String email, String category) {
    final newContact = Contact(
        firstname: firstName,
        lastname: lastName,
        mobilenumber: mobileNumber,
        email: email,
        category: category);
    contactBox.add(newContact);
  }

  List<Contact> getAllContacts() {
    return contactBox.values.toList();
  }

  void deleteContactAt(int index) {
    contactBox.deleteAt(index);
  }

  void editCategory(String categoryName, int index) {
    print("Index:  $index");
    box.putAt(index, Category.Category(categoryName: categoryName));
  }

  void editContact(Contact contact, int editIndex) {
    print("Index:  $editIndex");
    contactBox.putAt(editIndex, contact);
  }

  List<Contact> getSearchedContactByName(String value) {
    if (value == null || value == "") {
      print("Value is null");
    }
    print("Searched value : $value");
    List<Contact> searchedContacts = contactBox.values
        .where((contact) =>
            contact.firstname!.toLowerCase().contains(value.toLowerCase()))
        .toList();

    print("Searched Result ${searchedContacts.toString()}");
    return searchedContacts;
  }
}
