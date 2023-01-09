import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, tasksData, child) => ListView.builder(
        itemBuilder: (context, index) {
          final taskItems = tasksData.tasks[index];
          return TaskTile(
            name: taskItems.name,
            isChecked: taskItems.isDone,
            checkBoxState: (checkBoxState) {
              tasksData.updateTasks(taskItems);

              Timer(const Duration(milliseconds: 250), () {
                tasksData.deleteTask(taskItems);
              });
            },
            longPressed: () {
              Timer(const Duration(seconds: 1), () {
                tasksData.deleteTask(taskItems);
              });
            },
          );
        },
        itemCount: tasksData.tasks.length,
      ),
    );
  }
}
