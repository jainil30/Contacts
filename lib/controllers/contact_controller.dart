import 'package:contacts/hive_service.dart';
import 'package:contacts/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var contacts = <Contact>[].obs;
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var emailController = TextEditingController();
  var categoryController = TextEditingController().obs;
  var imagePathController = "".obs;
  var searchController = TextEditingController();
  var dropDownSelectedIndex = 0.obs;
  bool isEditMode = false;
  int index = 0;

  @override
  void onInit() {
    getAllContacts();
    super.onInit();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Delete Contact
   */
  void deleteContact(int index) {
    HiveService().deleteContactAt(index);
    getAllContacts();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Add Contact
   */
  void addContact(String firstName, String lastName, num mobileNumber,
      String email, String category, String imagePath) {
    HiveService().addContact(
        firstName, lastName, mobileNumber, email, category, imagePath);
    print("new contact added");
    getAllContacts();

    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    mobileNumberController.clear();
    imagePathController.value = "";
    // firstNameController.clear();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Print Contact
   */
  void printContact(Contact contact) {
    if (contact != null) {
      print("________________________");
      print("Firstname : ${contact.firstname}");
      print("Lastname : ${contact.lastname}");
      print("Mobile Number : ${contact.mobilenumber}");
      print("Email : ${contact.email}");
      print("Category : ${contact.category}");
    }
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Fetch All Contacts
   */
  void getAllContacts() {
    contacts.assignAll(HiveService().getAllContacts());
    print("_________________");
    for (Contact contact in contacts) {
      printContact(contact);
    }
    update();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Edit Contact
   */
  void editContact(String firstName, String lastName, int mobileNumber,
      String email, String category, String imagePath) {
    HiveService().editContact(
        Contact(
            firstname: firstName,
            lastname: lastName,
            mobilenumber: mobileNumber,
            email: email,
            category: category,
            imagepath: imagePath),
        index);

    getAllContacts();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Search Contact by name
   */
  void getContactsByContactName(String name) {
    contacts.assignAll(HiveService().getSearchedContactByName(name));
    print("_________________");
    for (Contact contact in contacts) {
      print(contact.firstname);
    }
    update();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Filter Contact by category
   */
  void getContactsByCategory(String category) {
    // contacts.assignAll(HiveService().getSearchedContactByCategory(category));
    // print("_________________");
    // for (Contact contact in contacts) {
    //   print(contact.firstname);
    // }
    List<Contact> list = HiveService()
        .contactBox
        .values
        .where((element) => element.category == category)
        .toList();
    contacts.value = list;
    print(contacts);
    update();
  }
}
