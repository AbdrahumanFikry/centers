import 'package:centers/src/student/providers/studentProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ActionViewer extends StatelessWidget {
  final bool isExam;
  final bool isToday;
  final int index;
  final String time;

  ActionViewer({
    this.isExam = true,
    this.isToday = false,
    this.index,
    this.time = '10:00-12:30',
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    String status = 'In time';
    Color statusColor = Colors.indigo[100];
    if (isToday) {
      status = Provider.of<StudentProvider>(context, listen: false)
          .calculateTimeDifference(
        startTime: time.split('-')[0],
        endTime: time.split('-')[1],
      );
      if (status == 'Finished') {
        statusColor = Theme.of(context).errorColor;
      } else if (status == 'Started') {
        statusColor = Colors.green;
      } else if (status == 'Soon') {
        statusColor = Colors.indigo[900];
      } else if (status == 'Canceled') {
        statusColor = Colors.black;
      }
    }
    return Container(
      height: screen.size.width > 500 ? 140 : 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: status == 'Soon' || status == 'Started'
            ? Colors.grey[200]
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(
          7.5,
        ),
        boxShadow: status == 'Soon' || status == 'Started'
            ? [
                BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 5.0,
                  spreadRadius: 1.5,
                  offset: Offset(
                    2.5,
                    3.5,
                  ),
                ),
              ]
            : [],
      ),
      margin: const EdgeInsets.only(
        right: 30.0,
        bottom: 5.0,
        top: 5.0,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: 10.0,
            decoration: BoxDecoration(
              color: status == 'Canceled'
                  ? Colors.black
                  : isExam
                      ? Theme.of(context).errorColor
                      : isToday ? Colors.indigo : Colors.grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  7.5,
                ),
                topLeft: Radius.circular(
                  7.5,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        isExam ? 'Exam' : 'Lesson',
                        style: TextStyle(
                          color: isExam
                              ? Theme.of(context).errorColor
                              : isToday ? Colors.indigo : Colors.grey,
                          fontFamily: 'Cairo',
                          fontSize: screen.size.width > 500 ? 20 : 16,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: screen.size.width > 500 ? 5.0 : 3.5,
                        backgroundColor: statusColor,
                      ),
                      SizedBox(
                        width: 3.5,
                      ),
                      Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontFamily: 'Cairo',
                          fontSize: screen.size.width > 500 ? 22 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Physics',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontSize: screen.size.width > 500 ? 22 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.chalkboardTeacher,
                        color: Colors.indigo,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 7.5,
                      ),
                      Expanded(
                        child: Text(
                          'Ahmed Elshinawy',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cairo',
                            fontSize: screen.size.width > 500 ? 18 : 14,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Spacer(),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontSize: screen.size.width > 500 ? 18 : 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
