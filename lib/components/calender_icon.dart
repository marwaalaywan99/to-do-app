import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class CalenderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () async{
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
          size: 40,));
  }
}

