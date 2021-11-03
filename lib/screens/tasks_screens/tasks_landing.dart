import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/classes/tasks_list_class.dart';
import 'package:to_do_app/components/calender_icon.dart';
import 'package:to_do_app/components/scrollable_calender.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/tasks_data.dart';
import 'package:to_do_app/screens/tasks_screens/add_tasks_screen.dart';
import 'package:to_do_app/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  @override
  void initState() {
    Provider.of<TasksModel>(context, listen: false).fetchData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: ()
    {
      Navigator.pushNamed(context, '/add task screen');
          },
          child: const Icon(Icons.add),
          //backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
          child: Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, bottom: 50.0, right: 15.0, left: 15.0),
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Tasks',
                            style: kscreensTitle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: IconButton(
                              icon: Icon(
                                Icons.calendar_today,
                                color: Colors.purple[600],
                                size: 40,
                              ),
                              onPressed: () async {
                                Calender().showDatePicker1(context);
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    //To show Calendar Widget
                    ScrollableCalender(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(child: TasksList()),
                  ],
                ),
              )),
        ));
  }
}
