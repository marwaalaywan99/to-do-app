import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(
          left: 15.0, top: 50.0, bottom: 50.0, right: 15.0),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Add Tasks',
              style: kscreensTitle,
            ),
          ),
        ]),
      ]),
    )));
  }
}
