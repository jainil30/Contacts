import 'dart:io';

import 'package:contacts/controllers/category_controller.dart';
import 'package:contacts/controllers/contact_controller.dart';
import 'package:contacts/controllers/drawer_controller.dart';
import 'package:contacts/custom_widgets/custom_scaffold.dart';
import 'package:contacts/custom_widgets/custome_text.dart';
import 'package:contacts/custom_widgets/text_form_field.dart';
import 'package:contacts/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/others.dart';

/*
    Created by: Jainil Dalwadi
    Purpose : Add Contact Screen
   */
class AddContactsScreen extends GetView<ContactController> {
  AddContactsScreen({super.key});

  //Unique Key for form
  final _formKey = GlobalKey<FormState>();

  //Category Controller to show categories in dropdown
  final categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    // populateDropDownMenuItems();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Obx(
              () => CircleAvatar(
                maxRadius: 100,
                foregroundImage:
                    FileImage(File(controller.imagePathController.value)),
                backgroundImage: const NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB9oF0K9m3KZbFrOm1s3GTB57LyEpOX2Rd9jFy91GDrw&s"),
              ),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AlertDialog(
                        title: Text("Select image from"),
                        actions: [
                          ElevatedButton(
                              onPressed: () async {
                                XFile? image =
                                    await selectImage(ImageSource.gallery);
                                controller.imagePathController.value =
                                    image!.path.toString();
                                Get.back();
                              },
                              child: const Text("Gallery")),
                          ElevatedButton(
                              onPressed: () async {
                                XFile? image =
                                    await selectImage(ImageSource.camera);
                                controller.imagePathController.value =
                                    image!.path.toString();

                                Get.back();
                              },
                              child: const Text("Camera")),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: controller.firstNameController,
                  hintText: "Enter Firstname",
                  labelText: "First Name",
                  textInputType: TextInputType.name,
                  color: Theme.of(context).primaryColor,
                ),
                CustomTextFormField(
                  controller: controller.lastNameController,
                  hintText: "Enter Lastname",
                  labelText: "Last Name",
                  textInputType: TextInputType.name,
                  color: Theme.of(context).primaryColor,
                ),
                CustomTextFormField(
                  controller: controller.mobileNumberController,
                  hintText: "Enter Mobile Number",
                  labelText: "Mobile Number",
                  textInputType: TextInputType.phone,
                  color: Theme.of(context).primaryColor,
                ),
                CustomTextFormField(
                  controller: controller.emailController,
                  hintText: "Enter Email",
                  labelText: "Email",
                  textInputType: TextInputType.emailAddress,
                  color: Theme.of(context).primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() {
                    print(categoryController.categories);
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Theme.of(context).primaryColor),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          isExpanded: true,
                          value: categoryController.selectedValue.value,
                          items: categoryController.categories
                              .map((element) => DropdownMenuItem(
                                    value: element.categoryName,
                                    child:
                                        Text(element.categoryName.toString()),
                                  ))
                              .toSet()
                              .toList(),
                          hint: const Text("Category"),
                          onChanged: (value) {
                            print("Dropdown Current:  ${value}");
                            categoryController.selectedValue.value =
                                value.toString();
                            print(
                                "Dropdown Current:  ${categoryController.selectedValue.value}");
                          },
                        ),
                      ),
                    );
                  }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    child: CustomText(
                      text: (controller.isEditMode) ? "Update" : "Save",
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(
                            "Dropdown Value : ${controller.categoryController.value.text.toString()}");
                        if (controller.isEditMode) {
                          print("If --> Edit Mode");

                          controller.editContact(
                              controller.firstNameController.text.toString(),
                              controller.lastNameController.text.toString(),
                              int.parse(controller.mobileNumberController.text
                                  .toString()),
                              controller.emailController.text.toString(),
                              categoryController.selectedValue.toString(),
                              controller.imagePathController.value);

                          controller.isEditMode = false;
                        } else {
                          print("Else --> Edit Mode");
                          controller.addContact(
                              controller.firstNameController.text.toString(),
                              controller.lastNameController.text.toString(),
                              int.parse(controller.mobileNumberController.text
                                  .toString()),
                              controller.emailController.text.toString(),
                              categoryController.selectedValue.toString(),
                              controller.imagePathController.value);
                        }

                        Get.snackbar(
                            "Form", "All fields are valid.\nContact Saved",
                            icon: Icon(Icons.done));
                        Get.to(MyScaffold(
                          body: ContactListScreen(),
                          title: 'Contacts',
                        ));

                        controller.firstNameController.text = "";
                        controller.lastNameController.text = "";
                        controller.mobileNumberController.text = "";
                        controller.emailController.text = "";
                        controller.categoryController.value.text = "";
                        controller.imagePathController.value = "";
                        DrawerListtileController.currentIndex.value = 2;
                        // Get.to(ContactListScreen());

                        // controller.firstNameController.text = "";
                        // controller.lastNameController.text = "";
                        // // controller.mobileNumberController.text = "";
                        // controller.emailController.text = "";
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
