import 'package:centers/src/student/ui/studentCategoriesScreen.dart';
import 'package:centers/src/student/ui/studentSchedule.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  AnimationController barAnimationController;
  Widget targetBody = StudentSchedule();
  bool isList = false;
  String actionStatus = 'In time';

  void handleListChanges() {
    isList = !isList;
    if (isList) {
      barAnimationController.forward();
      targetBody = StudentCategories();
    } else {
      barAnimationController.reverse();
      targetBody = StudentSchedule();
    }
    notifyListeners();
  }

  String calculateTimeDifference({String startTime, String endTime}) {
    int startHour = int.parse(startTime.split(':')[0]);
    int startMinute = int.parse(startTime.split(':')[1]);
    int endHour = int.parse(endTime.split(':')[0]);
    int endMinute = int.parse(endTime.split(':')[1]);
    var now = new DateTime.now();
    DateTime start = DateTime(
      now.year,
      now.month,
      now.day,
      startHour,
      startMinute,
    );
    DateTime end = DateTime(
      now.year,
      now.month,
      now.day,
      endHour,
      endMinute,
    );

    if (start.difference(now).inMinutes <= 30 &&
        start.difference(now).inMinutes > 0) {
      actionStatus = 'Soon';
    } else if (end.difference(now).inMinutes <=
            end.difference(start).inMinutes &&
        end.difference(now).inMinutes > 0) {
      actionStatus = 'Started';
    } else if (end.difference(now).inMinutes < 0) {
      actionStatus = 'Finished';
    }
    return actionStatus;
  }
}
