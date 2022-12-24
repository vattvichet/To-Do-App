import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String name;
  final Function(bool?) checkBoxState;
  const TaskTile(
      {Key? key,
      required this.name,
      required this.isChecked,
      required this.checkBoxState})
      : super(key: key);
//anonymous func
  // void checkBoxCallBack(bool? checkBoxState) {
  //   setState(() {
  //     isChecked = checkBoxState!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxState,
      ),
    );
  }
}
