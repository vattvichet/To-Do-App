import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          name: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkBoxState: (checkBoxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
