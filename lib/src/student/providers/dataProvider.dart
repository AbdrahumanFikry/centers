import 'package:centers/src/models/absenceDay.dart';
import 'package:flutter/material.dart';

class StudentData extends ChangeNotifier {
  int warnings = 0;
  List<MaterialAbsence> materialAbsence = [
    MaterialAbsence(
      materialName: 'English',
      allDays: 10,
      daysAbsence: 0,
      absenceDays: [],
    ),
    MaterialAbsence(
      materialName: 'Arabic',
      allDays: 10,
      daysAbsence: 2,
      absenceDays: [
        AbsenceDay(
          day: '8',
          month: 'Feb',
        ),
        AbsenceDay(
          day: '1',
          month: 'Mar',
        ),
      ],
    ),
    MaterialAbsence(
      materialName: 'Physics',
      allDays: 10,
      daysAbsence: 3,
      absenceDays: [
        AbsenceDay(
          day: '8',
          month: 'Feb',
        ),
        AbsenceDay(
          day: '1',
          month: 'Jan',
        ),
        AbsenceDay(
          day: '3',
          month: 'Jan',
        ),
      ],
    ),
    MaterialAbsence(
      materialName: 'Math',
      allDays: 10,
      daysAbsence: 0,
      absenceDays: [],
    ),
    MaterialAbsence(
      materialName: 'Science',
      allDays: 10,
      daysAbsence: 0,
      absenceDays: [],
    ),
  ];

  int warningCount() {
    int count = 0;
    materialAbsence.forEach((element) {
      if (element.daysAbsence > 1) {
        count++;
      }
    });
    warnings = count;
    return warnings;
  }
}
