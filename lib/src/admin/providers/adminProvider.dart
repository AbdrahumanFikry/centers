import 'package:centers/src/admin/ui/categoriesScreen.dart';
import 'package:centers/src/admin/ui/dashboradItems.dart';
import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  AnimationController barAnimationController;
  Widget targetBody = DashBoardItems();
  bool isList = false;

  void handleListChanges() {
    isList = !isList;
    if (isList) {
      barAnimationController.forward();
      targetBody = Categories();
    } else {
      barAnimationController.reverse();
      targetBody = DashBoardItems();
    }
    notifyListeners();
  }
}
