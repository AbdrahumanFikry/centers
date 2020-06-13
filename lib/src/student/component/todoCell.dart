import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TODOCell extends StatelessWidget {
  final int toDoListCount;

  TODOCell({
    this.toDoListCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Todo',
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Cairo',
              fontSize: ScreenUtil().setSp(
                44,
                allowFontScalingSelf: true,
              ),
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundColor: Colors.yellowAccent.withRed(5),
            radius: 15.0,
            child: Text(
              toDoListCount.toString(),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
