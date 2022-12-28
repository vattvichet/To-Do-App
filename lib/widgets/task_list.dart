import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  //use for returning the tasks after created

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, tasksData, child) => ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            name: tasksData.tasks[index].name,
            isChecked: tasksData.tasks[index].isDone,
            checkBoxState: (checkBoxState) {
              setState(() {
                tasksData.tasks[index].toggleDone();
              });
            },
          );
        },
        itemCount: tasksData.tasks.length,
      ),
    );
  }
}
