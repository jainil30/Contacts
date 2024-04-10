import 'package:contacts/custom_widgets/custome_text.dart';
import 'package:flutter/material.dart';

class CustomListviewItem extends StatelessWidget {
  const CustomListviewItem({Key? key, required this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CustomText(
              text: text ?? 'No text provided',
              color: const Color(0xffad802b),
              size: 20.0,
            ),
          )),
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
      ),
    );
  }
}
