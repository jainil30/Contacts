import 'package:contacts/controllers/contact_controller.dart';
import 'package:contacts/custom_widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListScreen extends GetView<ContactController> {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
          itemBuilder: (context, index) {
            return ContactListtileItem(
              index: index,
              contactName:
                  "${controller.contacts[index].firstname} ${controller.contacts[index].lastname}",
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: controller.contacts.length),
    );
  }
}
