import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/screens/tasks_screens/add_tasks_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
  ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            );
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.deepPurple,
        ),
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
                    child: IconButton(onPressed: () async{
                      DateTime newDateTime = await showRoundedDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 1),
                        borderRadius: 16,
                        theme: ThemeData(primarySwatch: Colors.deepPurple),
                      );
                    },
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.deepPurple,
                          size: 40,)),
                  ),
                ],
      ),
              SizedBox(height:20,),
              Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    selectedDate.day.toString() +
                        '-' +
                        listOfMonths[selectedDate.month - 1] +
                        ', ' +
                        selectedDate.year.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.deepPurple),
                  )),
              SizedBox(height: 10),
              //To show Calendar Widget
              Container(
                  height: 80,
                  child: Container(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10);
                        },
                        itemCount: 365,
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                currentDateSelectedIndex = index;
                                selectedDate =
                                    DateTime.now().add(Duration(days: index));
                              });
                            },
                            child: Container(
                              height: 80,
                              width: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: currentDateSelectedIndex == index
                                      ? Colors.deepPurple
                                      : Colors.white),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    listOfMonths[DateTime.now()
                                        .add(Duration(days: index))
                                        .month -
                                        1]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: currentDateSelectedIndex == index
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    DateTime.now()
                                        .add(Duration(days: index))
                                        .day
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: currentDateSelectedIndex == index
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    listOfDays[DateTime.now()
                                        .add(Duration(days: index))
                                        .weekday -
                                        1]
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: currentDateSelectedIndex == index
                                            ? Colors.white
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ))),
              SizedBox(height: 20,),
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    Card(
                      child: ListTile(
                        title: Text('Work Meeting'),
                        trailing: Icon(Icons.more_vert),
                      ),
                      //color: kMainRed,
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Doctor Appointment'),
                        trailing: Icon(Icons.more_vert),
                      ),
                      //color: kMainBlue,
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          'Call Old Friend',
                          style:
                          TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          'Buy Milk',
                          style:
                          TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          'Car Wash',
                          style:
                          TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
