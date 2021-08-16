import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(
          left: 15.0, top: 50.0, bottom: 50.0, right: 15.0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Add Tasks',
            style: kscreensTitle,
          ),
        ),
        TextField(
          controller: myController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Add task',
          ),
        ),
        SizedBox(height: 20,),
        Text(myController.text),
      ]),
    )));
  }
}
