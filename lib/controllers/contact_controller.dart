import 'package:contacts/database/contacts_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Contact.dart';

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

  int editContactId = 0;

  @override
  void onInit() {
    getAllContacts();
    super.onInit();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Delete Contact
   */
  void deleteContact(int id) {
    // HiveService().deleteContactAt(index);
    ContactsDatabase().deleteContact(id);
    getAllContacts();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Add Contact
   */
  void addContact(String firstName, String lastName, String mobileNumber,
      String email, String category, String imagePath) {
    print("Mobile : $mobileNumber");
    print("Image in controller  : $imagePath");
    // HiveService().addContact(
    //     firstName, lastName, mobileNumber, email, category, imagePath);
    print("new contact added");
    var contact = Contact(
        firstname: firstName,
        lastname: lastName,
        mobileNumber: mobileNumber,
        email: email,
        category: category,
        imagePath: imagePath);

    ContactsDatabase().insertContact(contact);

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
    print("________________________");
    print("ID : ${contact.contactId}");
    print("Firstname : ${contact.firstname}");
    print("Lastname : ${contact.lastname}");
    print("Mobile Number : ${contact.mobileNumber}");
    print("Email : ${contact.email}");
    print("Category : ${contact.category}");
    print("ImagePath : ${contact.imagePath}");
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Fetch All Contacts
   */
  void getAllContacts() async {
    // contacts.assignAll(HiveService().getAllContacts());

    var dbContacts = await ContactsDatabase().getContacts();
    contacts.assignAll(dbContacts);
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
  void editContact(int editContactId, String firstName, String lastName,
      int mobileNumber, String email, String category, String imagePath) {
    // HiveService().editContact(
    //     Contact(
    //         firstname: firstName,
    //         lastname: lastName,
    //         mobilenumber: mobileNumber,
    //         email: email,
    //         category: category,
    //         imagepath: imagePath),
    //     index);

    var contact = Contact(
        firstname: firstName,
        lastname: lastName,
        mobileNumber: mobileNumber.toString(),
        email: email,
        category: category,
        imagePath: imagePath);

    print("To Edit First name $editContactId");
    ContactsDatabase().editContact(contact, editContactId);

    getAllContacts();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Search Contact by name
   */
  void getContactsByContactName(String name) async {
    // contacts.assignAll(HiveService().getSearchedContactByName(name));
    var dbContacts = await ContactsDatabase().getContactsByName(name);
    contacts.assignAll(dbContacts);
    print("_________________");
    for (Contact contact in contacts) {
      print(contact.firstname);
    }
    if (name == "") {
      getAllContacts();
    }
    update();
  }

  /*
    Created by: Jainil Dalwadi
    Purpose : To Filter Contact by category
   */
  void getContactsByCategory(String category) async {
    // contacts.assignAll(HiveService().getSearchedContactByCategory(category));
    // print("_________________");
    // for (Contact contact in contacts) {
    //   print(contact.firstname);
    // }
    // List<Contact> list = HiveService()
    //     .contactBox
    //     .values
    //     .where((element) => element.category == category)
    //     .toList();
    // contacts.value = list;

    var dbContactList =
        await ContactsDatabase().getContactsByCategory(category);
    contacts.assignAll(dbContactList);

    print(contacts);
    update();
  }
}
