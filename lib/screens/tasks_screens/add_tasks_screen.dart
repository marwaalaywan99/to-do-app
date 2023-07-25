import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/tasks_class.dart';
import 'package:to_do_app/components/calender_icon.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/tasks_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final myController = TextEditingController();
  String? taskName;
  bool isSwitched = false;
  DateTime? date;
  TimeOfDay? time;
  final calender = Calender();
  Tasks task = Tasks();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  showDatePicker1(context) async {
    DateTime? datetime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime
          .now()
          .year - 1),
      lastDate: DateTime(DateTime
          .now()
          .year + 1),
      borderRadius: 16,
      theme: ThemeData(primarySwatch: kPurpleShade1),
    );
    print(date);
    setState(() {
      task.taskDate = datetime;
    });
  }

  showTimePicker1(context) async {
    TimeOfDay currentTime = TimeOfDay.now();
    TimeOfDay? time1 = await showTimePicker(
      context: context,
      initialTime: currentTime,
      initialEntryMode: TimePickerEntryMode.input,
    );
    print(time);
    setState(() {
      task.taskTime = time1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 50.0, bottom: 50.0, right: 15.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Text(
                          'Add Tasks',
                          style: kscreensTitle,
                        ),
                        new Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  addTitle(),
                  SizedBox(height: 5),
                  addDate(context),
                  SizedBox(height: 20),
                  addTime(context),
                  SizedBox(height: 20),
                  addReminder(),
                  SizedBox(
                    height: 30,
                  ),
                  addTask(),
                  // TextField(
                  //   controller: myController,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     hintText: 'Add task',
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  //Text(myController.text),
                ]),
              )),
        ));
  }

  Widget addTitle() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 8),
          child: Material(
            elevation: 10,
            shape: CircleBorder(),
            shadowColor: kPurpleShade1.withOpacity(0.5),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: kPurpleShade1,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Icon(
                  Icons.task,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0,
          width: 15,
        ),
        Flexible(
          // child: TextField(
          //   onSubmitted: (v) {
          //     FocusScope.of(context).requestFocus(focus);
          //   },
          //   onChanged: (string) {
          //     taskName = string;
          //   },
          //   decoration: InputDecoration.collapsed(
          //     hintText: 'Task Name',
          //     hintStyle: TextStyle(
          //       fontSize: 20,
          //     )
          //   ),
          // ),
          child: TextFormField(
            cursorColor: kPurpleShade1,
            maxLength: 10,
            decoration: InputDecoration(
              hintText: 'Enter Task Name',
              labelText: 'Task Name',
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPurpleShade1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPurpleShade1),
              ),
            ),
            onChanged: (string) {
              task.taskName = string;
              debugPrint(taskName);
              setState(() {});
            },
          ),
        )
      ],
    );
  }

  Widget addDate(context) {
    return GestureDetector(
      onTap: () async {
        showDatePicker1(context);
      },
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 8),
            child: Material(
              elevation: 10,
              shape: CircleBorder(),
              shadowColor: kPurpleShade1.withOpacity(0.5),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: kPurpleShade1,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0,
            width: 15,
          ),
          Text('Choose Date',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
          new Spacer(),
          Text(
              task.taskDate == null
                  ? ''
                  : task.taskDate!.day.toString() +
                  '/' +
                  task.taskDate!.month.toString() +
                  '/' +
                  task.taskDate!.year.toString(),
              style: TextStyle(fontSize: 20, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget addTime(context) {
    return GestureDetector(
      onTap: () async {
        showTimePicker1(context);
      },
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 8),
            child: Material(
              elevation: 10,
              shape: CircleBorder(),
              shadowColor: kPurpleShade1.withOpacity(0.5),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: kPurpleShade1,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0,
            width: 15,
          ),
          Text('Choose Time',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )),
          new Spacer(),
          Text(task.taskTime == null ? '' : task.taskTime!.format(context),
              style: TextStyle(fontSize: 20, color: Colors.black54))
        ],
      ),
    );
  }

  Widget addReminder() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 8),
          child: Material(
            elevation: 10,
            shape: CircleBorder(),
            shadowColor: kPurpleShade1.withOpacity(0.5),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: kPurpleShade1,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0,
          width: 15,
        ),
        Text('Remind me',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )),
        new Spacer(),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              task.taskReminder = isSwitched;
              print(isSwitched);
            });
          },
          activeTrackColor: kPurpleShade2Text,
          activeColor: kPurpleShade1,
        ),
      ],
    );
  }

  Widget addTask() {
    return ElevatedButton(
      onPressed: () {
        print('$task');
        Provider.of<TasksModel>(context, listen:false).addTask(task, context);
        Provider.of<TasksModel>(context, listen:false).clearList();
        print('Length of tasks ${Provider.of<TasksModel>(context, listen:false).taskCount}');
        Provider.of<TasksModel>(context, listen:false).fetchAllTasks();
        return successDialog();
      },
      child: Text(
        'Create Task',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }

  void successDialog() {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            titleTextStyle:
            TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, fontSize: 20),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                  onPressed: () {

                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/tasks screen');
                  },
                  child: Text("Done")),
            ],
            content: Text("Task added successfully !"),
          );
        });
  }
}
