import 'package:contacts/custom_widgets/listview_item.dart';
import 'package:flutter/material.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  var _formKey = GlobalKey<FormState>();
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: textController,
                decoration: InputDecoration(hintText: "Add Category"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 300,
          color: Color(0xffffe1bb),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return CustomListviewItem(
                  text: "Category !",
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: 5),
        )
      ],
    );
  }
}
