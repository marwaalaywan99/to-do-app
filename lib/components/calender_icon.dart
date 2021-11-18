import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/tasks_data.dart';

class Calender extends StatelessWidget{
  DateTime selectedDate;
  TimeOfDay selectedTime;

  Calender({this.selectedDate, this.selectedTime});

  void setDate(DateTime date, BuildContext context){
    selectedDate = date;
    //Provider.of<TasksModel>(context, listen:false).changeDate(context);
  }

  void setTime(TimeOfDay time){
    selectedTime = time;
  }

  DateTime getDate(){
    return selectedDate;
  }

  TimeOfDay getTime(){
    return selectedTime;
  }


  // @override
  // Widget build(BuildContext context) {
  //   return IconButton(onPressed: () async{
  //     DateTime newDateTime = await showRoundedDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(DateTime.now().year - 1),
  //       lastDate: DateTime(DateTime.now().year + 1),
  //       borderRadius: 16,
  //       theme: ThemeData(primarySwatch: Colors.deepPurple),
  //     );
  //   },
  //       icon: Icon(
  //         Icons.calendar_today,
  //         color: Colors.deepPurple,
  //         size: 40,));
  // }

//   Future<DateTime> showDatePicker1(BuildContext  context) async{
//     final DateTime date = await showRoundedDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(DateTime.now().year - 1),
//       lastDate: DateTime(DateTime.now().year + 1),
//       borderRadius: 16,
//       theme: ThemeData(primarySwatch: kMainPurple),
//   );
//
//   // setDate(date, context);
//   print(date);
//   return date;
//
// }

showTimePicker1(context) async{
  TimeOfDay currentTime = TimeOfDay.now();
  TimeOfDay time = await showTimePicker(
    context: context,
    initialTime: currentTime,
    initialEntryMode: TimePickerEntryMode.input,
  );
  setTime(time);
  print(time);
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

