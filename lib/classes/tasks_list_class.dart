import 'package:flutter/material.dart';
import 'package:to_do_app/classes/tasks_class.dart';

class TasksList{

  List<Tasks> tasksList = List<Tasks>.empty(growable: true);

  TasksList(){
    addTask(Tasks(taskName: 'Work Meeting', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: false));
    addTask(Tasks(taskName: 'Doctor Appointment', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: true));
  }

  void addTask(Tasks task){
    tasksList.add(task);
  }

  void deleteTask(Tasks task){
    tasksList.remove(task);
  }

  @override
  String toString(){
    print('Number of tasks: ${tasksList.length}');
    for(int i = 0; i < tasksList.length; i++){
      print('Task ${i+1}: ${tasksList[i]}');
    }

  }
}