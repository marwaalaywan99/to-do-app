import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.only(
        left: 15.0, top: 50.0, bottom: 50.0, right: 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20.0),
                    child: Text(
                      'Tasks',
                      style: kscreensTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: IconButton(onPressed: null,
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.deepPurple,
                          size: 40,)),
                  ),
                ],
      ),
            ],
          )),
    ));
  }
}
