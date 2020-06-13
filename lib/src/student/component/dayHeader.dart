import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DayHeader extends StatelessWidget {
  final int lessonsCount;
  final int examsCount;
  final int index;

  DayHeader({
    this.lessonsCount = 0,
    this.examsCount = 0,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
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
      height: 85.0,
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
            height: 75.0,
            width: 75.0,
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
                    fontSize: ScreenUtil().setSp(
                      34,
                      allowFontScalingSelf: true,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dayTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: ScreenUtil().setSp(
                      25,
                      allowFontScalingSelf: true,
                    ),
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
                    fontSize: ScreenUtil().setSp(
                      30,
                      allowFontScalingSelf: true,
                    ),
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
                    fontSize: ScreenUtil().setSp(
                      30,
                      allowFontScalingSelf: true,
                    ),
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
