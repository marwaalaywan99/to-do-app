import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/models/tasks_data.dart';

class ScrollableCalender extends StatefulWidget {

  DateTime selectedDate = DateTime.now();
  ScrollableCalender({this.selectedDate});

  @override
  _ScrollableContainerState createState() => _ScrollableContainerState();
}

class _ScrollableContainerState extends State<ScrollableCalender> {

  int currentDateSelectedIndex = 0;
  ScrollController scrollController = ScrollController();
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
    String date = DateTimeFormat.format(widget.selectedDate, format: AmericanDateFormats.dayOfWeek);
    return Column(
      children: [
        Container(
            height: 30,
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text(date,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: kPurpleShade3),
            )),
        SizedBox(height: 10),
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
                      widget.selectedDate = DateTime.now().add(Duration(days: index));
                    });
                    Provider.of<TasksModel>(context, listen:false).changeDate(widget.selectedDate, context);
                  },
                  child: Container(
                    height: 80,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: currentDateSelectedIndex == index
                            ? kPurpleShade1
                            : Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listOfMonths[
                                  widget.selectedDate.add(Duration(days: index)).month -
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
                          widget.selectedDate.add(Duration(days: index)).day.toString(),
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
      ],
    );
  }
}
