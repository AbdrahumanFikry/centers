import 'package:flutter/material.dart';

enum QuestionType {
  MCQ,
  TrueFalse,
}

class ExamToAnswer extends ChangeNotifier {
  QuestionType type;
  String question;
  String image;
  int id;
  String answer;
  List<Option> options;

  ExamToAnswer({
    this.id = 0,
    this.type,
    this.answer = 'Null',
    this.image,
    this.options,
    this.question = 'Null',
  });
}

class Option extends ChangeNotifier {
  int id;
  String title;

  Option({
    this.id = 0,
    this.title = 'Null',
  });
}
