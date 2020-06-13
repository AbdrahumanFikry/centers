import 'package:centers/src/student/component/dayHeader.dart';
import 'package:flutter/material.dart';

class DayScheduler extends StatelessWidget {
  final int index;

  DayScheduler({
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: 500,
      color: Colors.transparent,
      padding: EdgeInsets.only(
        right: 5.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DayHeader(
            index: index,
            lessonsCount: 3,
            examsCount: 1,
          ),
        ],
      ),
    );
  }
}
