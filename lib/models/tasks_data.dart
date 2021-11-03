import 'dart:collection';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/classes/tasks_class.dart';
import 'dart:convert';

class TasksModel extends ChangeNotifier{
  final httpClient = http.Client();
  List<dynamic> tasksData;
  Map<String, String> customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json;charset=UTF-8"
  };

  List<Tasks> _tasks = [
    Tasks(taskName: 'Work Meeting', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: false, markedAsDone: false),
    Tasks(taskName: 'Doctor Appointment', taskDate: DateTime.now(), taskTime: TimeOfDay.now(), taskReminder: true, markedAsDone: true),
  ];

  UnmodifiableListView<Tasks> get tasks => UnmodifiableListView(_tasks);

  // int get taskCount{
  //   return tasksData.length;
  // }

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


   //Get request
  Future fetchData() async {
    final Uri restAPIURL =
        Uri.parse("http://localhost:1900/");
    http.Response response = await httpClient.get(restAPIURL);
    final Map parsedData = await json.decode(response.body.toString());
    tasksData = parsedData['data'];
    print(tasksData);
  }
}