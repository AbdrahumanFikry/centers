import 'package:centers/src/models/absenceDay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayHandler extends StatelessWidget {
//  final String day;
//  final String month;
//
//  DayHandler({
//    this.day = 'null',
//    this.month = 'null',
//  });

  @override
  Widget build(BuildContext context) {
    final dayData = Provider.of<AbsenceDay>(context);
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      width: screen.size.width > 500 ? 85.0 : 75.0,
      margin: const EdgeInsets.only(
        left: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.indigo[100],
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            dayData.day,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            dayData.month,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
