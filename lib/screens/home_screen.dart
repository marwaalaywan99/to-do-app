import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:to_do_app/components/custom_dialog.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/data/tasks_class.dart';
import 'package:to_do_app/screens/tasks_screens/tasks_landing.dart';
import 'package:to_do_app/widgets/tasks_list.dart';

import '../models/tasks_data.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;
  late Tasks task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, top: 50.0, bottom: 50.0, right: 15.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
//                  SizedBox(
//                    height: 50.0,
//                  ),
                Row(
                  children: [
//                      SizedBox(
//                         width: 15.0
//                      ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialog(
                                listItems: avatarListView(),
                              );
                            });
                      },
                      child: CircleAvatar(
                        radius: 50.0,
                        //TODO background image to be changed when user creates the account on app
                        backgroundImage: AssetImage('images/default_profile.jpg'),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      //TODO User to be changed to the user's actual name
                      'Hello, User !',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: kPurpleShade3
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    SizedBox(width: 15.0),
                    Text('${currentDate()}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kGrey
                      ),),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 5.0),
                  child: Expanded(
                    child: SalomonBottomBar(
                      currentIndex: _currentIndex,
                      onTap: (i) {
                        setState(() => _currentIndex = i);
                      },
                      items: [
                        SalomonBottomBarItem(icon: Icon(Icons.list), title: Text("Tasks", style: TextStyle(color: kPurpleShade11),), selectedColor: kPurpleShade2, unselectedColor: Colors.black54),
                        SalomonBottomBarItem(icon: Icon(Icons.timer), title: Text("Reminders", style: TextStyle(color: kBlueShade1Text),), selectedColor: kBlueShade1, unselectedColor: Colors.black54),
                        SalomonBottomBarItem(icon: Icon(Icons.calendar_today_outlined), title: Text("Calender", style: TextStyle(color: kOrangeShade1Text),), selectedColor: kOrangeShade1, unselectedColor: Colors.black54),
                        SalomonBottomBarItem(icon: Icon(Icons.more_horiz), title: Text("More", style: TextStyle(color: kPurpleShade3),), selectedColor: kPurpleShade3, unselectedColor: Colors.black54)
                      ],
                    ),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     ElevatedButton(onPressed: null, child: Text('Tasks')),
                    //     ElevatedButton(onPressed: null, child: Text('Reminders')),
                    //     ElevatedButton(onPressed: null, child: Text('Calender')),
                    //     ElevatedButton(
                    //         onPressed: (){
                    //           return showDialog(
                    //               context: context,
                    //               builder: (BuildContext context) {
                    //                 return CustomDialog(
                    //                   listItems: moreScreensListView(),
                    //                 );
                    //               });
                    //         }, child: Icon(Icons.more_vert))
                    //   ],
                    // ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tasks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: kPurpleShade3
                        ),
                      ),
                      TextButton(onPressed: (){
                        //Provider.of<TasksModel>(context, listen:false).deleteAllTasks();
                        Navigator.pushNamed(context, '/tasks screen');
                      }, child: Text('View all', style: TextStyle(color: kPurpleShade1),)),
                    ],
                  ),
                ),
                Expanded(child: TasksList(date: DateTime.now(),)),
              ],
            ),
          ),
        )),
    );
  }


  String currentDate() {
    final date = DateTime.now();
    //print(date.format(AmericanDateFormats.dayOfWeek));
    return DateTimeFormat.format(date, format: AmericanDateFormats.dayOfWeek);
  }

  Widget avatarListView() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ListView(
        shrinkWrap: true,
        children: [
          SimpleDialogOption(
            child: const Text('View Profile', style: kDialogTextStyle),
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          SimpleDialogOption(
            child: const Text('Settings', style: kDialogTextStyle),
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          SimpleDialogOption(
            child: const Text('Logout', style: kDialogTextStyle),
            onPressed: () {},
          ),
        ],
      )
    ]);
  }

  Widget moreScreensListView() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ListView(
        shrinkWrap: true,
        children: [
          SimpleDialogOption(
            child: const Text('Notes', style: kDialogTextStyle),
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          SimpleDialogOption(
            child: const Text('Alarm', style: kDialogTextStyle),
            onPressed: () {},
          ),
        ],
      )
    ]);
  }
}
