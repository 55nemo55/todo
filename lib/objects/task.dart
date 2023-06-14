import 'package:flutter/material.dart';

class Task {
   String taskName;
  var taskDescription;
  bool isDone;

  Task({required this.taskName, this.taskDescription, this.isDone=false});

  void toggleDone(){
    isDone= !isDone;
  }

}
