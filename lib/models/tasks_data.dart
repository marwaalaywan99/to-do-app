import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/classes/tasks_class.dart';

class TasksModel extends ChangeNotifier{

  List<Tasks> _tasksBasedonDates;
  List<Tasks> _tasks = [
    Tasks(taskName: 'Work Meeting', taskDate: DateTime(2022), taskTime: TimeOfDay.now(), taskReminder: false, markedAsDone: false),
    Tasks(taskName: 'Doctor Appointment', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: true, markedAsDone: true),
    Tasks(taskName: 'Doctor Appointment', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: true, markedAsDone: true),
    Tasks(taskName: 'Doctor Appointment', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: true, markedAsDone: true),
  ];

  UnmodifiableListView<Tasks> get tasks => UnmodifiableListView(_tasks);

  int get taskCount{
    return _tasks.length;
  }

  //void tasksBasedonDates()

  void addTask(Tasks task){
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Tasks task){
    _tasks.remove(task);
    notifyListeners();
  }

  void editTask(Tasks oldtask, Tasks newtask){
    _tasks.remove(oldtask);
    _tasks.add(newtask);
    notifyListeners();
  }

  void markAsDone(Tasks task){
    task.markedAsDone = true;
    notifyListeners();
  }
}