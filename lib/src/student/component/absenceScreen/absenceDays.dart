import 'package:centers/src/models/absenceDay.dart';
import 'package:centers/src/student/component/absenceScreen/dayHandler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AbsenceDays extends StatelessWidget {
  final List<AbsenceDay> days;

  AbsenceDays({
    this.days,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      height: screen.size.width > 500 ? 85.0 : 75.0,
      width: double.infinity,
      color: Colors.transparent,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return true;
        },
        child: ListView.builder(
          itemCount: days.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: days[index],
              child: DayHandler(),
            );
          },
        ),
      ),
    );
  }
}
