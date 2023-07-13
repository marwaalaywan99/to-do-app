import 'dart:collection';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:to_do_app/data/tasks_class.dart';
import 'package:to_do_app/components/calender_icon.dart';

final _firestore = FirebaseFirestore.instance;

class TasksModel extends ChangeNotifier{

  List<Tasks> _tasks = [
  //   Tasks(taskName: 'Work Meeting', taskDate: DateTime(2022), taskTime: TimeOfDay.now(), taskReminder: false, markedAsDone: false),
  //   Tasks(taskName: 'Doctor Appointment', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: true, markedAsDone: true),
  //   Tasks(taskName: 'Doctor Appointment', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: true, markedAsDone: true),
  //   Tasks(taskName: 'Doctor Appointment', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: true, markedAsDone: true),
   ];

  Calender cal = Calender();
  DateTime? date;
  bool calDateSelected = false;

  UnmodifiableListView<Tasks> get tasks => UnmodifiableListView(_tasks);


  int get taskCount{
    return _tasks.length;
  }

  void clearList(){
    _tasks.length = 0;
    notifyListeners();
  }

  void addTask(Tasks task, BuildContext context){
    // final now = new DateTime.now();
    // final dt = DateTime(task.taskTime.hour, task.taskTime.minute);
    // final format = DateFormat.jm();  //"6:00 AM"
    // String time = format.format(dt);
    final t = task.taskTime?.format(context);
    print(t);
    final time1 = t?.split(":");
    print(time1);
    final time3 = time1?[0];
    print(time3);
    final time2 = time1?[1].split(" ");
    print(time2);
    final time = time3! + ':' + time2![0];
    print(time);
    _firestore.collection('tasks').add({
      'taskName': task.taskName,
      'taskDate': task.taskDate.toString(),
      'taskTime': time,
      'taskReminder': task.taskReminder,
      'markedAsDone': task.markedAsDone
    });
    // _tasks.add(task);
    // notifyListeners();
  }

  void fetchAllTasks() async {
    clearList();
    await for (var snap in _firestore.collection('tasks').snapshots()){
      for(var message in snap.docs){
        print(message.data());
        _tasks.add(fixTasksFields(message.data()));
      }
    }
    print('_tasks $_tasks');
    notifyListeners();
    print('NOTIFIEEDDD');
  }

  Tasks fixTasksFields(Map<String, dynamic> map){
    Tasks task = Tasks();
    task.taskName = map['taskName'];
    task.taskDate = DateTime.parse(map['taskDate']);
    task.taskTime = TimeOfDay(hour:int.parse(map['taskTime'].split(":")[0]),minute: int.parse(map['taskTime'].split(":")[1]));
    print(task.taskTime);
    task.taskReminder = map['taskReminder'] == null ? false : true;
    task.markedAsDone = map['markedAsDone'];
    print('TASSSKKK $task');
    return task;
  }

  Future<void> deleteAllTasks() async {
    var collection = FirebaseFirestore.instance.collection('tasks');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
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

  void changeDate(DateTime selectedDate, bool calSelected, BuildContext context){
    date = selectedDate;
    calDateSelected = calSelected;
    print('CAL $date');
    notifyListeners();
  }
}