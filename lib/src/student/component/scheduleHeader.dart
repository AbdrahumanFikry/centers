import 'package:centers/src/student/component/todoCell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ScheduleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      height: screen.size.width > 500 ? 115 : 100,
      width: screen.size.width,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Today',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: ScreenUtil().setSp(
                    screen.size.width > 500 ? 30 : 50,
                    allowFontScalingSelf: true,
                  ),
                ),
                textAlign: TextAlign.right,
              ),
              Spacer(),
              Text(
                DateFormat('EEE, MMM d').format(DateTime.now()),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: ScreenUtil().setSp(
                    screen.size.width > 500 ? 15 : 26,
                    allowFontScalingSelf: true,
                  ),
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Spacer(),
          TODOCell(
            toDoListCount: 2,
          ),
        ],
      ),
    );
  }
}
