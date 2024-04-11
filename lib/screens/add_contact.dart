import 'package:contacts/controllers/category_controller.dart';
import 'package:contacts/controllers/contact_controller.dart';
import 'package:contacts/controllers/drawer_controller.dart';
import 'package:contacts/custom_widgets/custom_scaffold.dart';
import 'package:contacts/custom_widgets/custome_text.dart';
import 'package:contacts/custom_widgets/text_form_field.dart';
import 'package:contacts/screens/contacts_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactsScreen extends GetView<ContactController> {
  AddContactsScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final categoryController = Get.put(CategoryController());

  // List<DropdownMenuItem<String>> dropDownMenuItems = [];
  //
  // void populateDropDownMenuItems() async {
  //   CategoryController categoryController = CategoryController();
  //
  //   for (Category category in categoryController.categories) {
  //     dropDownMenuItems.add(
  //       DropdownMenuItem(
  //         child: Text(category.categoryName.toString()),
  //         value: category.categoryName.toString(),
  //       ),
  //     );
  //   }
  // }

  // DropdownMenuItem(
  // child: Text("One"),
  // value: "1",
  // ),
  // DropdownMenuItem(
  // child: Text("Two"),
  // value: "2",
  // ),
  // DropdownMenuItem(
  // child: Text("Three"),
  // value: "3",
  // )

  @override
  Widget build(BuildContext context) {
    // populateDropDownMenuItems();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            maxRadius: 100,
            foregroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB9oF0K9m3KZbFrOm1s3GTB57LyEpOX2Rd9jFy91GDrw&s"),
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
                    return DropdownButton(
                      value: categoryController.selectedValue.value,
                      items: categoryController.categories
                          .map((element) => DropdownMenuItem(
                                value: element.categoryName,
                                child: Text(element.categoryName.toString()),
                              ))
                          .toList(),
                      hint: const Text("Category"),
                      onChanged: (value) {
                        categoryController.selectedValue.value =
                            value.toString();
                      },
                    );
                  }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    child: CustomText(
                      text: "Save",
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: BeveledRectangleBorder(),
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (controller.isEditMode) {
                          print("If --> Edit Mode");

                          controller.editContact(
                              controller.firstNameController.text.toString(),
                              controller.lastNameController.text.toString(),
                              int.parse(controller.mobileNumberController.text
                                  .toString()),
                              controller.emailController.text.toString(),
                              controller.categoryController.value.text);

                          controller.isEditMode = false;
                        } else {
                          print("Else --> Edit Mode");
                          controller.addContact(
                              controller.firstNameController.text.toString(),
                              controller.lastNameController.text.toString(),
                              int.parse(controller.mobileNumberController.text
                                  .toString()),
                              controller.emailController.text.toString(),
                              controller.categoryController.value.text);
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
