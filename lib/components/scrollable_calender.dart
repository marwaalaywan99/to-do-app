import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';

class ScrollableCalender extends StatefulWidget {
  @override
  _ScrollableContainerState createState() => _ScrollableContainerState();
}

class _ScrollableContainerState extends State<ScrollableCalender> {
  DateTime selectedDate = DateTime.now();
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
    return Column(
      children: [
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
                  color: kMainPurple),
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
                      selectedDate = DateTime.now().add(Duration(days: index));
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: currentDateSelectedIndex == index
                            ? kMainPurple
                            : Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listOfMonths[
                                  DateTime.now().add(Duration(days: index)).month -
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
                          DateTime.now().add(Duration(days: index)).day.toString(),
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
