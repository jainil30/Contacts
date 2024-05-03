import 'dart:io';

import 'package:contacts/controllers/contact_controller.dart';
import 'package:contacts/controllers/drawer_controller.dart';
import 'package:contacts/custom_widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Contact.dart';

//Single Contact Item
class ContactListtileItem extends GetView<ContactController> {
  const ContactListtileItem(
      {super.key, required this.contact, required this.index});

  final Contact? contact;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          foregroundImage: FileImage(File(contact!.imagePath.toString())),
          backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB9oF0K9m3KZbFrOm1s3GTB57LyEpOX2Rd9jFy91GDrw&s"),
          // foregroundImage: (contact!.imagepath != "")
          //     ? FileImage(File(contact!.imagepath.toString()))
          //     : NetworkImage(
          //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB9oF0K9m3KZbFrOm1s3GTB57LyEpOX2Rd9jFy91GDrw&s"),
          minRadius: 35,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  color: Colors.black38,
                  text:
                      "${contact!.firstname.toString()} ${contact!.lastname.toString()}",
                  size: 20,
                ),
                CustomText(
                  color: Colors.black38,
                  text: "${contact!.mobileNumber.toString()}",
                  size: 15,
                ),
                CustomText(
                  color: Colors.black38,
                  text: "${contact!.category.toString()}",
                  size: 10,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 36, // Adjust the width as needed
          height: 36, // Adjust the height as needed
          child: IconButton(
            onPressed: () {
              controller.isEditMode = true;
              controller.index = index!;

              controller.firstNameController.text =
                  controller.contacts[controller.index].firstname.toString();
              controller.lastNameController.text =
                  controller.contacts[controller.index].lastname.toString();
              controller.emailController.text =
                  controller.contacts[controller.index].email.toString();
              controller.mobileNumberController.text =
                  controller.contacts[controller.index].mobileNumber.toString();

              controller.imagePathController.value =
                  controller.contacts[controller.index].imagePath.toString();
              // controller.firstNameController.text = controller.contacts[controller.index!].firstname.toString();

              controller.editContactId =
                  controller.contacts[controller.index].contactId!.toInt();
              DrawerListtileController.currentIndex.value = 1;
            },
            icon: Image.asset('assets/images/edit.png'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 5),
          width: 36, // Adjust the width as needed
          height: 36, // Adjust the height as needed
          child: IconButton(
            onPressed: () {
              Get.snackbar("Contact Deleted",
                  "${controller.contacts[index!].firstname.toString()} ${controller.contacts[index!].lastname.toString()}",
                  icon: Icon(Icons.delete));
              controller.deleteContact(
                  controller.contacts[index!].contactId!.toInt());
            },
            icon: Image.asset('assets/images/delete.png'),
          ),
        ),
      ],
    );
  }
}
