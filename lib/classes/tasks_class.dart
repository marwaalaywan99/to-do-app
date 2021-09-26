import 'package:flutter/material.dart';

class Tasks{

  String taskName;
  DateTime taskDate;
  TimeOfDay taskTime;
  bool taskReminder;
  List<Tasks> tasksList = List();


  Tasks({this.taskName, this.taskDate, this.taskTime, this.taskReminder});

  @override
  String toString(){
    return 'Task{task name: $taskName, task date: $taskDate, task time: $taskTime, task reminder: $taskReminder}';
  }
}

