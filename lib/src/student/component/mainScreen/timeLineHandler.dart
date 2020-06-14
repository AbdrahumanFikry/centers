import 'package:flutter/material.dart';

import 'file:///E:/Flutter_Projects/centers/lib/src/student/component/mainScreen/ActrionViewer.dart';

class TimeLineHandler extends StatelessWidget {
  final bool isToday;
  final int index;

  TimeLineHandler({
    this.isToday = false,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ActionViewer(
              isExam: false,
              isToday: isToday,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
