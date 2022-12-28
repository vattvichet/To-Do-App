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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: const Color.fromARGB(150, 190, 75, 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          //set border radius more than 50% of height and width to make circle
        ),
        elevation: 7,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: ListTile(
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
          ),
        ),
      ),
    );
  }
}
