import 'package:flutter/material.dart';

class Tasks{

  String taskName;
  DateTime taskDate;
  TimeOfDay taskTime;
  bool taskReminder;
  bool markedAsDone;



  Tasks({this.taskName, this.taskDate, this.taskTime, this.taskReminder, this.markedAsDone = false});

  @override
  String toString(){
    return 'Task{task name: $taskName, task date: $taskDate, task time: $taskTime, task reminder: $taskReminder}';
  }

}

