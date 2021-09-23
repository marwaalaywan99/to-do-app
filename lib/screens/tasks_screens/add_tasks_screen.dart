import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:to_do_app/components/calender_icon.dart';
import 'package:to_do_app/constants/colors.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final myController = TextEditingController();
  String taskName;
  bool isSwitched = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focus = FocusNode;
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
          addTitle(focus),
          SizedBox(height: 5),
          addDate(context),
          SizedBox(height: 20),
          addTime(context),
          SizedBox(height: 20),
          addReminder(),
          SizedBox(height: 30,),
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

  Widget addTitle(focus) {
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
            maxLength: 10,
            decoration: InputDecoration(
              hintText: 'Enter Task Name',
              labelText: 'Task Name',
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
              taskName = string;
              debugPrint(taskName);
            },
          ),
        )
      ],
    );
  }

  Widget addDate(context) {
    return GestureDetector(
      onTap: () async {
        Calender().showDatePicker(context);
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
              ))
        ],
      ),
    );
  }

  Widget addTime(context) {
    return GestureDetector(
      onTap: () async {
        Calender().showTimePicker1(context);
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
              ))
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
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              print(isSwitched);
            });
          },
          activeTrackColor: Colors.purple[300],
          activeColor: kMainPurple,
        ),
      ],
    );
  }

  Widget addTask(){
    return ElevatedButton(
        onPressed: (){

        },
        child:
    Text('Create Task',
    style: TextStyle(
      fontSize: 20,
    ),),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    ),);
  }
}
