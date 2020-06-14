import 'package:centers/src/student/component/dayHeader.dart';
import 'package:centers/src/student/component/timeLineHandler.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayScheduler extends StatelessWidget {
  final int index;

  DayScheduler({
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    int day = int.parse(DateFormat('d').format(DateTime.now())) + index;
    String dayTitle = DateFormat('EEE').format(
      DateTime.now().add(
        Duration(days: index),
      ),
    );
    bool isToday = false;
    if (day == DateTime.now().day) {
      isToday = true;
    }
    return Container(
      width: screen.size.width > 500
          ? 500
          : MediaQuery.of(context).size.width * 0.95,
//      height: 500,
      color: Colors.transparent,
      padding: EdgeInsets.only(
        right: screen.size.width > 500 ? 20.0 : 5.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DayHeader(
            isToday: isToday,
            lessonsCount: 3,
            examsCount: 1,
            day: day,
            dayTitle: dayTitle,
          ),
          TimeLineHandler(
            index: index,
            isToday: isToday,
          ),
        ],
      ),
    );
  }
}
