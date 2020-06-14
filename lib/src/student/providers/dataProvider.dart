import 'dart:convert';

import 'package:centers/src/models/timeLineData.dart';
import 'package:flutter/material.dart';

class StudentData extends ChangeNotifier {
  var date = {
    "data": [
      {
        "id": 1,
        "day": "sat",
        "time_line": [
          {
            "id": 11,
            "title": "Physics",
            "time": "10:00-11:00",
            "type": "exam",
            "teacher": "Abdrahuman Fikry"
          },
          {
            "id": 22,
            "title": "Arabic",
            "time": "12:00-2:00",
            "type": "lesson",
            "teacher": "Mohammed Essam"
          },
          {
            "id": 33,
            "title": "French",
            "time": "4:30-5:30",
            "type": "lesson",
            "teacher": "Ahmed Mostafa"
          }
        ]
      },
      {
        "id": 2,
        "day": "sun",
        "time_line": [
          {
            "id": 11,
            "title": "Data Structure",
            "time": "10:00-11:00",
            "type": "lesson",
            "teacher": "Abdrahuman Fikry"
          },
          {
            "id": 22,
            "title": "Arabic",
            "time": "12:00-2:00",
            "type": "lesson",
            "teacher": "Mohammed Essam"
          },
          {
            "id": 33,
            "title": "Algorithms",
            "time": "4:30-5:30",
            "type": "lesson",
            "teacher": "Ahmed Mostafa"
          }
        ]
      },
      {
        "id": 3,
        "day": "mon",
        "time_line": [
          {
            "id": 11,
            "title": "Physics",
            "time": "10:00-11:00",
            "type": "lesson",
            "teacher": "Abdrahuman Fikry"
          },
          {
            "id": 22,
            "title": "Arabic",
            "time": "12:00-2:00",
            "type": "lesson",
            "teacher": "Mohammed Essam"
          },
          {
            "id": 33,
            "title": "French",
            "time": "4:30-5:30",
            "type": "exam",
            "teacher": "Ahmed Mostafa"
          }
        ]
      }
    ]
  };
  TimeLineData timeLineData;
  int lessons = 0;
  int exams = 0;

  void fetchData() async {
    String jsonData = json.encode(date);
    timeLineData = await json.decode(jsonData);
    timeLineData.data.forEach((element) {
      element.timeLine.forEach((e) {
        e.type == 'lesson' ? lessons++ : exams++;
      });
    });
    notifyListeners();
  }
}
