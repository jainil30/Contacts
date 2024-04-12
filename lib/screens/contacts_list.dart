import 'package:contacts/controllers/contact_controller.dart';
import 'package:contacts/custom_widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/custom_bottomdrawer_listview.dart';

class ContactListScreen extends GetView<ContactController> {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search",
              labelText: "Search",
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              icon: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CustomBottomDrawerListView();
                      },
                    );
                  },
                  icon: const Icon(Icons.filter_alt_rounded)),
            ),
            controller: controller.searchController,
            onChanged: (value) {
              controller.getContactsByContactName(value);
            },
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(2),
            child: Obx(
              () => ListView.separated(
                  itemBuilder: (context, index) {
                    // print("----------------->");
                    // for (var contact in controller.contacts) {
                    //   print(contact.firstname);
                    // }

                    return Obx(
                      () => ContactListtileItem(
                        index: index,
                        contact: controller.contacts[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: controller.contacts.length),
            ),
          ),
        ),
      ],
    );
  }
}
