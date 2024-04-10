import 'package:contacts/screens/add_contact.dart';
import 'package:contacts/screens/create_category_screen.dart';

class Screen {
  static List<Map<String, dynamic>> screens = [
    {'screen': AddCategoryScreen(), 'appBarTitle': 'Create and Store Category'},
    {'screen': AddContactsScreen(), 'appBarTitle': 'Add Contact'},
    {'screen': AddCategoryScreen(), 'appBarTitle': 'Create and Store Category'},
  ];
}
