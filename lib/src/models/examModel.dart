import 'package:flutter/material.dart';

class ExamModel extends ChangeNotifier {
  final String materialName;
  final String examTitle;
  final DateTime date;
  final String time;
  final double mark;
  final double scoured;

  ExamModel({
    this.materialName,
    this.examTitle,
    this.date,
    this.time,
    this.mark,
    this.scoured,
  });
}
