import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/tasks_data.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/screens/tasks_screens/add_tasks_screen.dart';
import 'package:to_do_app/screens/tasks_screens/tasks_landing.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TasksModel(),
    child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
        ],
        theme: ThemeData(fontFamily: "Varela", primarySwatch: kPurpleShade1),
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/tasks screen': (context) => TasksScreen(),
          '/add task screen': (context) => AddTaskScreen(),
        }),
  ));
}
