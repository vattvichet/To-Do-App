import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_list.dart';

import 'task.dart';

class TasksData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "Go to school"),
    Task(name: "Go to gym"),
    Task(name: "Back home"),
    Task(name: "Go to the garden"),
  ];

  int get tasksCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }

  void updateTasks(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
