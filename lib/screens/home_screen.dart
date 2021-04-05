import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 50.0, bottom: 50.0, right: 15.0),
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
                      CircleAvatar(
                        radius: 50.0,
                        //TODO background image to be changed when user creates the account on app
                        backgroundImage: AssetImage('images/default_profile.jpg'),
                      ),
                      SizedBox(
                        width:  20.0,
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
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      SizedBox(
                          width: 15.0
                      ),
                      Text('${currentDate()}'),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: null,
                            child: Text(
                              'Tasks'
                            )),

                        ElevatedButton(
                            onPressed: null,
                            child: Text(
                                'Reminders'
                            )),
                        ElevatedButton(
                            onPressed: null,
                            child: Text(
                                'Calender'
                            )),
                        ElevatedButton(
                            onPressed: null,
                            child: Icon(Icons.more_vert))
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tasks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),),
                        Text('View all'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: const <Widget>[
                        Card(
                          child: ListTile(
                            title: Text('Work Meeting'),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Doctor Appointment'),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Call Old Friend',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough ),),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Buy Milk',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough ),),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Car Wash',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough ),),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  String currentDate(){
    final date = DateTime.now();
    //print(date.format(AmericanDateFormats.dayOfWeek));
     return DateTimeFormat.format(date, format: AmericanDateFormats.dayOfWeek);
  }

  
}

