import 'package:centers/src/admin/ui/categoriesScreen.dart';
import 'package:centers/src/student/ui/studentSchedule.dart';
import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier {
  AnimationController barAnimationController;
  Widget targetBody = StudentSchedule();
  bool isList = false;

  void handleListChanges() {
    isList = !isList;
    if (isList) {
      barAnimationController.forward();
      targetBody = Categories();
    } else {
      barAnimationController.reverse();
      targetBody = StudentSchedule();
    }
    notifyListeners();
  }
}
