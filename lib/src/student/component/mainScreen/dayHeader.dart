import 'package:flutter/material.dart';

class DayHeader extends StatelessWidget {
  final int lessonsCount;
  final int examsCount;
  final bool isToday;
  final int day;
  final String dayTitle;

  DayHeader({
    this.lessonsCount = 0,
    this.examsCount = 0,
    this.isToday = false,
    this.day = 0,
    this.dayTitle = 'null',
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      height: screen.size.width > 500 ? 95.0 : 85.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      margin: const EdgeInsets.only(
        top: 7.5,
        right: 10.0,
        bottom: 15.0,
      ),
      padding: const EdgeInsets.only(
        left: 5.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: screen.size.width > 500 ? 85.0 : 75.0,
            width: screen.size.width > 500 ? 85.0 : 75.0,
            decoration: BoxDecoration(
              color: isToday ? Colors.indigo[900] : Colors.grey[500],
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  day.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: screen.size.width > 500 ? 24 : 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dayTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: screen.size.width > 500 ? 20 : 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          lessonsCount > 0
              ? Text(
                  '$lessonsCount lesson, ',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontFamily: 'Cairo',
                    fontSize: screen.size.width > 500 ? 24 : 18,
                  ),
                )
              : SizedBox(
                  width: 0.5,
                ),
          examsCount > 0
              ? Text(
                  '$examsCount exam',
                  style: TextStyle(
                    color: Colors.indigo[900],
                    fontFamily: 'Cairo',
                    fontSize: screen.size.width > 500 ? 24 : 18,
                  ),
                )
              : SizedBox(
                  width: 0.5,
                ),
          Spacer(),
        ],
      ),
    );
  }
}
