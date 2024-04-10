import 'package:contacts/custom_widgets/custome_text.dart';
import 'package:contacts/custom_widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactsScreen extends StatelessWidget {
  AddContactsScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var emailController = TextEditingController();
  var categoryController = TextEditingController();

  List<DropdownMenuItem> dropDownMenuItems = [
    DropdownMenuItem(
      child: Text("One"),
      value: "1",
    ),
    DropdownMenuItem(
      child: Text("Two"),
      value: "2",
    ),
    DropdownMenuItem(
      child: Text("Three"),
      value: "3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                  controller: firstNameController,
                  hintText: "Enter Firstname",
                  labelText: "First Name",
                  textInputType: TextInputType.name,
                  color: Theme.of(context).primaryColor,
                ),
                CustomTextFormField(
                  controller: lastNameController,
                  hintText: "Enter Lastname",
                  labelText: "Last Name",
                  textInputType: TextInputType.name,
                  color: Theme.of(context).primaryColor,
                ),
                CustomTextFormField(
                  controller: mobileNumberController,
                  hintText: "Enter Mobile Number",
                  labelText: "Mobile Number",
                  textInputType: TextInputType.phone,
                  color: Theme.of(context).primaryColor,
                ),
                CustomTextFormField(
                  controller: emailController,
                  hintText: "Enter Email",
                  labelText: "Email",
                  textInputType: TextInputType.emailAddress,
                  color: Theme.of(context).primaryColor,
                ),
                CustomTextFormField(
                  controller: firstNameController,
                  hintText: "Enter Firstname",
                  labelText: "First Name",
                  textInputType: TextInputType.name,
                  color: Theme.of(context).primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    items: dropDownMenuItems,
                    hint: const Text("Category"),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).primaryColor))),
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value.isBlank) {
                        return "Please select category";
                      }
                    },
                  ),
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
                        Get.snackbar(
                            "Form", "All fields are valid.\nContact Saved");
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
