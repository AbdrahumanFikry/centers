import 'package:flutter/material.dart';

class MaterialAbsence extends ChangeNotifier {
  final String materialName;
  final int daysAbsence;
  final int allDays;
  final List<AbsenceDay> absenceDays;

  MaterialAbsence({
    this.materialName,
    this.allDays,
    this.daysAbsence,
    this.absenceDays,
  });
}

class AbsenceDay extends ChangeNotifier {
  final String day;
  final String month;

  AbsenceDay({
    this.day,
    this.month,
  });
}
