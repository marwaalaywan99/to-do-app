import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    SizedBox(
                       width: 15.0
                    ),
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
                )
              ],
            )),
      ),
    );
  }
}

