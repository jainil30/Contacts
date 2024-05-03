// import 'package:contacts/models/category.dart' as Category;
//
// class HiveService {
//   final box = Boxes.getCategories();
//   final contactBox = Boxes.getContacts();
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To Add Category to Hive Data Box 'category'
//    */
//   void addCategory(String categoryName) {
//     // final box = Hive.box<Category>(_categoryBoxName);
//
//     final newCategory = Category.Category(categoryName: categoryName);
//     box.add(newCategory);
//   }
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To fetch all categories from Hive Data Box 'category'
//    */
//   List<Category.Category> getAllCategories() {
//     return box.values.toList();
//   }
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To Delete Category from Hive Data Box 'category'
//    */
//   void deleteCategoryAt(int index) {
//     box.deleteAt(index);
//   }
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To Add Contact to Hive Data Box 'contacts'
//    */
//   void addContact(String firstName, String lastName, num mobileNumber,
//       String email, String category, String imagePath) {
//     final newContact = Contact(
//         firstname: firstName,
//         lastname: lastName,
//         mobilenumber: mobileNumber,
//         email: email,
//         category: category,
//         imagepath: imagePath);
//     contactBox.add(newContact);
//   }
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To fetch all contacts from Hive Data Box 'contact'
//    */
//   List<Contact> getAllContacts() {
//     return contactBox.values.cast<Contact>().toList();
//   }
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To Delete contact from Hive Data Box 'contact'
//    */
//   void deleteContactAt(int index) {
//     contactBox.deleteAt(index);
//   }
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To Edit Contact to Hive Data Box 'contact'
//    */
//   void editCategory(String categoryName, int index) {
//     print("Index:  $index");
//     box.putAt(index, Category.Category(categoryName: categoryName));
//   }
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To Edit Contact to Hive Data Box 'contact'
//    */
//   void editContact(Contact contact, int editIndex) {
//     print("Index:  $editIndex");
//     contactBox.putAt(editIndex, contact);
//   }
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To Search Contact from Hive Data Box 'contact'
//    */
//   List<Contact> getSearchedContactByName(String value) {
//     if (value == null || value == "") {
//       print("Value is null");
//     }
//     print("Searched value : $value");
//     List<Contact> searchedContacts = contactBox.values
//         .where((contact) =>
//             contact.firstname!.toLowerCase().contains(value.toLowerCase()) ||
//             contact.lastname!.toLowerCase().contains(value.toLowerCase()) ||
//             contact.mobilenumber!
//                 .toString()
//                 .toLowerCase()
//                 .contains(value.toLowerCase()))
//         .toList();
//
//     print("Searched Result ${searchedContacts.toString()}");
//     return searchedContacts;
//   }
//
//   /*
//     Created by: Jainil Dalwadi
//     Purpose : To Filter Contact based on category to Hive Data Box 'contact'
//    */
//   List<Contact> getSearchedContactByCategory(String value) {
//     if (value == null || value == "") {
//       print("Value is null");
//     }
//     print("Searched value : $value");
//     List<Contact> searchedContacts = contactBox.values
//         .where((contact) =>
//             contact.category!.toLowerCase().contains(value.toLowerCase()))
//         .toList();
//
//     print("Searched Result ${searchedContacts.toString()}");
//     return searchedContacts;
//   }
// }
