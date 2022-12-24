import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';

import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(name: "Breakfast"),
    Task(name: "Lunch"),
    Task(name: "Dinner"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          name: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkBoxState: (checkBoxState) {
            setState(() {
              tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
