import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tasks{

  String taskName;
  DateTime? taskDate;
  TimeOfDay? taskTime;
  bool? taskReminder;
  bool markedAsDone;


  //QuerySnapshot querySnapshot;


  Tasks({this.taskName = "", this.taskDate, this.taskTime, this.taskReminder, this.markedAsDone = false});

  @override
  String toString(){
    return 'Task{task name: $taskName, task date: $taskDate, task time: $taskTime, task reminder: $taskReminder}';
  }

  Tasks.fromJson(Map<dynamic, dynamic> json)
      : taskName = json['taskName'] as String,
        taskDate = DateTime.parse(json['taskDate'] as String),
        taskTime = TimeOfDay(hour:int.parse(json['taskTime'].split(":")[0]),minute: int.parse(json['taskTime'].split(":")[1])),
        taskReminder = json['taskReminder'],
        markedAsDone = json['markedAsDone'];


  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'taskName': taskName,
    'taskDate': taskDate.toString(),
    'taskTime': taskTime.toString(),
    'taskReminder': taskReminder,
    'markedAsDone': markedAsDone,
  };

}

