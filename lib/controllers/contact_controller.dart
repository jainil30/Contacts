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

  var dropDownSelectedIndex = 0.obs;
  bool isEditMode = false;
  int index = 0;

  @override
  void onInit() {
    getAllContacts();
    super.onInit();
  }

  void deleteContact(int index) {
    HiveService().deleteContactAt(index);
    getAllContacts();
  }

  void addContact(String firstName, String lastName, num mobileNumber,
      String email, String category) {
    HiveService()
        .addContact(firstName, lastName, mobileNumber, email, category);
    print("new contact added");
    getAllContacts();

    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    mobileNumberController.clear();
    // firstNameController.clear();
  }

  void getAllContacts() {
    contacts.assignAll(HiveService().getAllContacts());
    print("_________________");
    for (Contact contact in contacts) {
      print(contact.firstname);
    }
    update();
  }

  void editContact(String firstName, String lastName, int mobileNumber,
      String email, String category) {
    HiveService().editContact(
        Contact(
            firstname: firstName,
            lastname: lastName,
            mobilenumber: mobileNumber,
            email: email,
            category: category),
        index);

    getAllContacts();
  }
}
