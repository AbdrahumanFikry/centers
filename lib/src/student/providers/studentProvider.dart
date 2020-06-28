import 'package:centers/src/student/ui/studentCategoriesScreen.dart';
import 'package:centers/src/student/ui/studentSchedule.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  AnimationController barAnimationController;
  AnimationController timerController;
  Widget targetBody = StudentSchedule();
  bool isList = false;
  double toDHeight = 150.0;
  bool isExpanded = false;
  String actionStatus = 'In time';
  String countTimer = '00:00';
  int pageIndex = 0;
  PageController pageController;

  moveToPage({int targetIndex}) {
    pageIndex = targetIndex;
    pageController.animateToPage(
      targetIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    notifyListeners();
  }

  String get timerString {
    Duration duration = timerController.duration * timerController.value;
    countTimer =
        '${(duration.inMinutes).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    return countTimer;
  }

  void startStopTimer() {
    if (timerController.isAnimating)
      timerController.stop();
    else {
      timerController.reverse(
        from: timerController.value == 0.0 ? 1.0 : timerController.value,
      );
    }
  }

  void expand({int itemLength, double constantLength}) {
    isExpanded = !isExpanded;
    if (isExpanded) {
      toDHeight = itemLength * constantLength;
    } else {
      toDHeight = 150.0;
    }
    notifyListeners();
  }

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
