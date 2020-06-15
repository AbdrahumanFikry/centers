import 'package:flutter/material.dart';

class DayHandler extends StatelessWidget {
  final String day;
  final String month;

  DayHandler({
    this.day = 'null',
    this.month = 'null',
  });

  @override
  Widget build(BuildContext context) {
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
            day,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            month,
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
