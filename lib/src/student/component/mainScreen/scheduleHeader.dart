import 'package:centers/src/student/component/mainScreen/todoCell.dart';
import 'package:flutter/material.dart';

class ScheduleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      height: screen.size.height > 600 ? 100 : 75,
      width: screen.size.width,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome back,',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: screen.size.width > 500 ? 20 : 14,
                ),
                textAlign: TextAlign.right,
              ),
              Expanded(
                child: Text(
                  'Abdrahuman Fikry',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: screen.size.width > 500 ? 30 : 20,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                ),
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
