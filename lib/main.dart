import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/screens/tasks_screens/tasks_landing.dart';

void main() {
  runApp(MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
      ],
      home: MyApp()));
}

