import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/classes/tasks_class.dart';
import 'package:to_do_app/components/calender_icon.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/tasks_data.dart';

class EditTaskScreen extends StatefulWidget {
  final Tasks task;

  const EditTaskScreen({Key key, @required this.task}) : super(key: key);
  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final myController = TextEditingController();
  String taskName;
  bool isSwitched = false;
  DateTime date;
  TimeOfDay time;
  final calender = Calender();
  Tasks newTask = Tasks();
  

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  showDatePicker1(context) async {
    DateTime datetime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime
          .now()
          .year - 1),
      lastDate: DateTime(DateTime
          .now()
          .year + 1),
      borderRadius: 16,
      theme: ThemeData(primarySwatch: kMainPurple),
    );
    print(date);
    setState(() {
      newTask.taskDate = datetime;
    });
  }

  showTimePicker1(context) async {
    TimeOfDay currentTime = TimeOfDay.now();
    TimeOfDay time1 = await showTimePicker(
      context: context,
      initialTime: currentTime,
      initialEntryMode: TimePickerEntryMode.input,
    );
    print(time);
    setState(() {
      widget.task.taskTime = time1;
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
            shadowColor: Colors.purple[600].withOpacity(0.5),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.purple[600],
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
            cursorColor: Colors.purple[600],
            maxLength: 20,
            decoration: InputDecoration(
              hintText: widget.task.taskName,
              labelText: 'Task Name',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple[600]),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple[600]),
              ),
            ),
            onChanged: (string) {
              newTask.taskName = string;
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
              shadowColor: Colors.purple[600].withOpacity(0.5),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.purple[600],
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
              newTask.taskDate == null
                  ? widget.task.taskDate.day.toString() +
                    '/' +
                    widget.task.taskDate.month.toString() +
                    '/' +
                    widget.task.taskDate.year.toString()
                  : newTask.taskDate.day.toString() +
                    '/' +
                    newTask.taskDate.month.toString() +
                    '/' +
                    newTask.taskDate.year.toString(),
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
              shadowColor: Colors.purple[600].withOpacity(0.5),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.purple[600],
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
          Text(newTask.taskTime == null
              ? widget.task.taskTime.format(context)
              : newTask.taskTime.format(context),
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
            shadowColor: Colors.purple[600].withOpacity(0.5),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.purple[600],
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
          value: widget.task.taskReminder,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              newTask.taskReminder = isSwitched;
              print(isSwitched);
            });
          },
          activeTrackColor: Colors.purple[300],
          activeColor: kMainPurple,
        ),
      ],
    );
  }

  Widget addTask() {
    return ElevatedButton(
      onPressed: () {
        return successDialog();
      },
      child: Text(
        'Edit Task',
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

  Future<void> successDialog() {
    return showDialog<void>(
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
                    Provider.of<TasksModel>(context, listen:false).editTask(widget.task, newTask);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/tasks screen');
                  },
                  child: Text("Done")),
            ],
            content: Text("Task updated successfully !"),
          );
        });
  }
}
