import 'package:flutter/material.dart';

//Custom Text Widget
class CustomText extends StatelessWidget {
  const CustomText(
      {super.key, required this.color, required this.text, this.size});

  final Color? color;
  final String? text;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
