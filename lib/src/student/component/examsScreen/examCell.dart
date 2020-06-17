import 'package:centers/src/models/examModel.dart';
import 'package:centers/src/student/providers/studentProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class ExamCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cellData = Provider.of<ExamModel>(context);
    String status = 'In time';
    bool isToday = cellData.date.day == DateTime.now().day;
    MediaQueryData screen = MediaQuery.of(context);
    Color statusColor = Colors.indigo[300];
    if (isToday) {
      status = Provider.of<StudentProvider>(context, listen: false)
          .calculateTimeDifference(
        startTime: cellData.time.split('-')[0],
        endTime: cellData.time.split('-')[1],
      );
      if (status == 'Finished') {
        statusColor = Colors.indigo[300];
      } else if (status == 'Started') {
        statusColor = Colors.green;
      } else if (status == 'Soon') {
        statusColor = Colors.indigo[900];
      } else if (status == 'Canceled') {
        statusColor = Colors.black;
      }
    }
    return Container(
      width: screen.size.width > 500 ? 500 : null,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 7.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cellData.materialName,
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontFamily: 'Cairo',
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    cellData.examTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontSize: 24.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Date : ',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Cairo',
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        DateFormat('MMM ,d ,y').format(cellData.date),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Time : ',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Cairo',
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        cellData.time,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  CircularPercentIndicator(
                    animation: true,
                    animationDuration: 2,
                    radius: 70.0,
                    lineWidth: 5.0,
                    percent: cellData.scoured / cellData.mark,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        isToday ||
                                status == 'Soon' ||
                                cellData.date.isAfter(DateTime.now())
                            ? SizedBox()
                            : Column(
                                children: <Widget>[
                                  Text(
                                    cellData.scoured.toString(),
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 5.0,
                                  ),
                                ],
                              ),
                        FittedBox(
                          child: Text(
                            cellData.mark.toString(),
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: isToday ||
                                      status == 'Soon' ||
                                      cellData.date.isAfter(DateTime.now())
                                  ? 24.0
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    progressColor: Colors.green,
                  ),
                  RaisedButton(
                    child: Text(
                      isToday && status == 'Started'
                          ? 'Start exam'
                          : cellData.date.isAfter(DateTime.now())
                              ? 'Not yet'
                              : 'View',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                        fontSize: 16.0,
                      ),
                    ),
                    color: statusColor,
                    onPressed:
                        cellData.date.isAfter(DateTime.now()) ? null : () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
