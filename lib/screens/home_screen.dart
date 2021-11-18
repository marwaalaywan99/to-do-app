import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:to_do_app/components/custom_dialog.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/screens/tasks_screens/tasks_landing.dart';
import 'package:to_do_app/widgets/tasks_list.dart';

class MyApp extends StatelessWidget {
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
                        return showDialog(
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
                    Text('${currentDate()}'),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 5.0),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: null, child: Text('Tasks')),
                        ElevatedButton(onPressed: null, child: Text('Reminders')),
                        ElevatedButton(onPressed: null, child: Text('Calender')),
                        ElevatedButton(
                            onPressed: (){
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialog(
                                      listItems: moreScreensListView(),
                                    );
                                  });
                            }, child: Icon(Icons.more_vert))
                      ],
                    ),
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
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, '/tasks screen');
                      }, child: Text('View all')),
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
