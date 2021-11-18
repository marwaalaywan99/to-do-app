import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/classes/tasks_list_class.dart';
import 'package:to_do_app/components/calender_icon.dart';
import 'package:to_do_app/components/scrollable_calender.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/tasks_data.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/screens/tasks_screens/add_tasks_screen.dart';
import 'package:to_do_app/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, '/');
        setState(() {
          selectedDate = DateTime.now();
        });
        Provider.of<TasksModel>(context, listen:false).changeDate(selectedDate, context);
        return false;
      },
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add task screen');
            },
            child: const Icon(Icons.add),
            //backgroundColor: Colors.deepPurple,
          ),
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, bottom: 50.0, right: 15.0, left: 15.0),
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
                                  showDatePicker1(context);
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //To show Calendar Widget
                      ScrollableCalender(selectedDate: selectedDate,),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(child: TasksList()),
                    ],
                  ),
                )),
          )),
    );
  }

  Future<DateTime> showDatePicker1(BuildContext  context) async{
    final DateTime date = await showRoundedDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
      theme: ThemeData(primarySwatch: kMainPurple),
    );

    if (date != null && date != selectedDate)
      setState(() {
        selectedDate = date;
        ScrollableCalender().selectedDate = date;
      });
    print(date);
    Provider.of<TasksModel>(context, listen:false).changeDate(selectedDate, context);
  }
}
