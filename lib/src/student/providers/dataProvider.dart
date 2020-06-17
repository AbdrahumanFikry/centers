import 'package:centers/src/models/absenceDay.dart';
import 'package:centers/src/models/examModel.dart';
import 'package:flutter/material.dart';

class StudentData extends ChangeNotifier {
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
  int earlier = 0;
  int finished = 0;
  List<ExamModel> earlierExams = [];
  List<ExamModel> finishedExams = [];

  List<ExamModel> exams = [
    ExamModel(
      materialName: 'Physics',
      examTitle: 'Newton Lows',
      date: DateTime(2020, 2, 13),
      time: '10:00-12:00',
      mark: 30,
      scoured: 24,
    ),
    ExamModel(
      materialName: 'English',
      examTitle: 'Grammar',
      date: DateTime(2020, 7, 1),
      time: '9:00-12:00',
      mark: 100,
      scoured: 0,
    ),
    ExamModel(
      materialName: 'Arabic',
      examTitle: 'Story',
      date: DateTime(2020, 3, 25),
      time: '15:30-18:30',
      mark: 100,
      scoured: 85,
    ),
    ExamModel(
      materialName: 'Math',
      examTitle: 'Algebra',
      date: DateTime(2020, 9, 26),
      time: '6:30-9:30',
      mark: 25,
      scoured: 0,
    ),
    ExamModel(
      materialName: 'Geology',
      examTitle: 'Rocks',
      date: DateTime(2020, 3, 25),
      time: '20:00-21:00',
      mark: 25,
      scoured: 25,
    ),
  ];

  int warningCount() {
    int count = 0;
    materialAbsence.forEach((element) {
      if (element.daysAbsence > 1) {
        count++;
      }
    });
    return count;
  }

  void fetchEarlierExams() {
    earlier = 0;
    earlierExams = [];
    exams.forEach((element) {
      if (element.date.isAfter(DateTime.now())) {
        earlierExams.add(element);
        earlier++;
      }
    });
    notifyListeners();
  }

  void fetchFinishedExams() {
    finished = 0;
    finishedExams = [];
    exams.forEach((element) {
      if (element.date.isBefore(DateTime.now())) {
        finishedExams.add(element);
        finished++;
      }
    });
    notifyListeners();
  }
}
