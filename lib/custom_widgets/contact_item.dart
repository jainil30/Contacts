import 'package:contacts/custom_widgets/custome_text.dart';
import 'package:flutter/material.dart';

class ContactListtileItem extends StatelessWidget {
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
          child: CustomText(
            color: Colors.black38,
            text: contactName.toString(),
            size: 20,
          ),
        ),
        SizedBox(
          width: 36, // Adjust the width as needed
          height: 36, // Adjust the height as needed
          child: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/edit.png'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 5),
          width: 36, // Adjust the width as needed
          height: 36, // Adjust the height as needed
          child: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/delete.png'),
          ),
        ),
      ],
    );
  }
}
