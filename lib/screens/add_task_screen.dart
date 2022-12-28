import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_data.dart';
import 'package:todo_list/widgets/task_list.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskInput = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            const Divider(
              thickness: 5,
              height: 25,
              color: Colors.grey,
              indent: 100,
              endIndent: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: taskInput,
                autofocus: true,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: "Enter Your Task",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (taskInput.text.isNotEmpty) {
                  Provider.of<TasksData>(context, listen: false)
                      .addTask(taskInput.text);
                }
                Navigator.pop(context);
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "CONFIRM",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
