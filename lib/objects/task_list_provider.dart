import 'package:flutter/material.dart';
import 'package:my_own_todo/objects/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _Tasks = [];

  get tasksList => _Tasks;

  void addTask(String newTask) {
    final task = Task(taskName: newTask);
    _Tasks.add(task);
    notifyListeners();
  }

  // void addDescription(String newTask,String newDescription){
  //   final task=Task(taskName: newTask,taskDescription: newDescription);
  //   _Tasks.add(task);
  //   notifyListeners();
  // }

  void editTask(Task oldTask, String newTaskTitle) {
    int index = _Tasks.indexOf(oldTask);
    final editedTask = Task(taskName: newTaskTitle);

    // oldTask.taskDescription != null ? oldTask.taskDescription=editedTask.taskDescription:;

    _Tasks[index] = editedTask;
    notifyListeners();
  }

  void addDescription(Task task, String taskDescription) {
    task.taskDescription = taskDescription;
    notifyListeners();
  }

  void toggleDoneProvider(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _Tasks.remove(task);
    notifyListeners();
  }

  // void showDialog(Task task) {
  //    showDialog(context: context, builder: (BuildContext context){
  //         return AlertDialog(
  //
  //         );
  //       });
  // }
}
