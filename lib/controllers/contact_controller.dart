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

  var searchedController = TextEditingController();

  var searchedContact = "".obs;

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

  // void searchedContactByFirstname() {
  //   contacts.clear();
  //
  //   contacts.assignAll(
  //       HiveService().getSearchedContactByName(searchedContact.value));
  //
  //   print(contacts.map((element) => print(element.firstname)));
  // }

  void searchedContactByFirstname() {
    print("searchedContact.value : ${searchedContact.value}");
    print("searchedController.text : ${searchedController.text}");

    // Clear the current list of contacts
    contacts.clear();

    // Get the searched contacts based on the value in searchedContact.value
    List<Contact> searchedContacts =
        HiveService().getSearchedContactByName(searchedContact.value);

    // Assign the searched contacts to the contacts list
    contacts.assignAll(searchedContacts);

    // Print the first names of the searched contacts (optional)
    print(contacts.map((contact) => contact.firstname));
  }
}
