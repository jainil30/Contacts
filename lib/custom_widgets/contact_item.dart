import 'package:contacts/controllers/contact_controller.dart';
import 'package:contacts/controllers/drawer_controller.dart';
import 'package:contacts/custom_widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListtileItem extends GetView<ContactController> {
  const ContactListtileItem(
      {super.key, required this.contactName, required this.index});

  final String? contactName;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          foregroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB9oF0K9m3KZbFrOm1s3GTB57LyEpOX2Rd9jFy91GDrw&s"),
          minRadius: 35,
        ),
        Expanded(
          child: Column(
            children: [
              CustomText(
                color: Colors.black38,
                text: contactName.toString(),
                size: 20,
              ),
            ],
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
                  controller.contacts[controller.index!].firstname.toString();
              controller.lastNameController.text =
                  controller.contacts[controller.index!].lastname.toString();
              controller.emailController.text =
                  controller.contacts[controller.index!].email.toString();
              controller.mobileNumberController.text = controller
                  .contacts[controller.index!].mobilenumber!
                  .toString();
              // controller.firstNameController.text = controller.contacts[controller.index!].firstname.toString();

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
                      icon: Icon(Icons.delete))
                  .show();
              controller.deleteContact(index!);
            },
            icon: Image.asset('assets/images/delete.png'),
          ),
        ),
      ],
    );
  }
}
