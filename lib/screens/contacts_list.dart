import 'package:contacts/custom_widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ContactListtileItem(
            index: index,
            contactName: "Jainil Dalwadi",
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: 20);
  }
}
