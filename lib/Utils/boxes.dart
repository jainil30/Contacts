import 'package:contacts/models/category.dart' as Category;
import 'package:contacts/models/contact.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Category.Category>? _categoriesBox;
  static Box<Category.Category> getCategories() {
    if (_categoriesBox == null) {
      _categoriesBox = Hive.box<Category.Category>("category");
    }
    return _categoriesBox!;
  }

  static Box<Contact>? _contactsBox;
  static Box<Contact> getContacts() {
    if (_contactsBox == null) {
      _contactsBox = Hive.box<Contact>("contact");
    }
    return _contactsBox!;
  }
}
