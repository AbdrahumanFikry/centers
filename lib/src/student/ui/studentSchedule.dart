import 'package:centers/src/student/component/scheduleHeader.dart';
import 'package:centers/src/student/component/timeTable.dart';
import 'package:flutter/material.dart';

class StudentSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      height: screen.size.height - screen.padding.top - 94,
      width: screen.size.width,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ScheduleHeader(),
          TimeTable(),
        ],
      ),
    );
  }
}
