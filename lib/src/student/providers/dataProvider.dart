import 'package:centers/src/models/absenceDay.dart';
import 'package:centers/src/models/chat.dart';
import 'package:centers/src/models/examModel.dart';
import 'package:centers/src/models/examToAnswerModel.dart';
import 'package:centers/src/models/toDoModel.dart';
import 'package:centers/src/student/component/messagesScreen/messageViewer.dart';
import 'package:flutter/material.dart';

class StudentData extends ChangeNotifier {
  int earlier = 0;
  int finished = 0;
  List<ExamModel> earlierExams = [];
  List<ExamModel> finishedExams = [];
  TextEditingController message = TextEditingController();
  String messageText = '';
  List<ToDoModel> earlierToDo = [];
  List<ToDoModel> comingToDo = [];
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
  List<Widget> messages = [
    MessageViewer(
      type: 'me',
      date: '12/5/2020',
      content: 'assets/images/user.png',
    ),
    MessageViewer(
      type: 'else',
      date: '12/5/2020',
      content: 'Hello from the other side ',
    ),
    MessageViewer(
      type: 'me',
      date: '12/5/2020',
      content: 'Hello',
    ),
  ];
  List<Chat> chats = [
    Chat(
      name: 'Ahmed Mostafa',
      lastMessage: 'Hi Abdrahuman',
      date: '12:30 am',
      read: false,
    ),
    Chat(
      name: 'Mohamed Essam',
      lastMessage: 'How are you?',
      date: '10:34 pm',
      read: false,
    ),
    Chat(
      name: 'Sayed Kamal',
      lastMessage: 'Eggy',
      date: '2:00 am',
      read: true,
    ),
  ];

  List<ExamToAnswer> examToAnswer = [
    ExamToAnswer(
      id: 1,
      question:
          'As a child, what did you think would be awesome about being an adult, but isn’t as awesome as you thought it would be?',
      answer: null,
      image: 'assets/images/examExample.jpeg',
      type: QuestionType.MCQ,
      options: [
        Option(id: 11, title: 'Work'),
        Option(id: 22, title: 'Responsibility'),
        Option(id: 33, title: 'Freedom'),
        Option(id: 44, title: 'Marriage'),
      ],
    ),
    ExamToAnswer(
      id: 3,
      question: ' What mythical creature do you wish actually existed?',
      answer: null,
      image: null,
      type: QuestionType.TrueFalse,
      options: [
        Option(id: 55, title: 'True'),
        Option(id: 66, title: 'False'),
      ],
    ),
    ExamToAnswer(
      id: 3,
      question: 'Who do you wish you could get back into contact with?',
      answer: null,
      image: 'assets/images/examExample.jpeg',
      type: QuestionType.MCQ,
      options: [
        Option(id: 55, title: 'Dad'),
        Option(id: 66, title: 'Mom'),
        Option(id: 77, title: 'Wife'),
        Option(id: 88, title: 'Friend'),
      ],
    ),
  ];

  List<ToDoModel> toDos = [
    ToDoModel(
      title: 'HomeWork',
      date: DateTime(2020, 6, 29),
      material: 'Physics',
    ),
    ToDoModel(
      title: 'Assignment',
      date: DateTime(2020, 7, 5),
      material: 'Math',
    ),
    ToDoModel(
      title: 'Task',
      date: DateTime(2020, 7, 25),
      material: 'DataBase',
    ),
    ToDoModel(
      title: 'Project',
      date: DateTime(2020, 8, 1),
      material: 'Math',
    ),
    ToDoModel(
      title: 'Bla Blaject',
      date: DateTime(2020, 8, 1),
      material: 'Math',
    ),
  ];

  int readCount() {
    int read = 0;
    chats.forEach((element) {
      if (!element.read) {
        read++;
      }
    });
    return read;
  }

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

  void filterToDo() {
    earlierToDo = [];
    comingToDo = [];
    DateTime now = DateTime.now();
    toDos.forEach((element) {
      if (element.date.difference(now).inDays <= 2) {
        earlierToDo.add(element);
      } else {
        comingToDo.add(element);
      }
    });
    earlierToDo
        .sort((first, second) => first.date.difference(second.date).inDays);
    notifyListeners();
  }

  void typing(String value) {
    messageText = value;
    message.selection = TextSelection.collapsed(offset: message.text.length);
    notifyListeners();
  }

  void addMessage() {
    final cell = MessageViewer(
      content: messageText,
      date: DateTime.now().toString().split(' ')[0],
      id: 0,
      type: 'me',
    );
    messages.add(cell);
    notifyListeners();
    message.clear();
  }

  void answer({int answerId}) {
    examToAnswer.forEach((question) {
      question.options.forEach((option) {
        if (option.id == answerId) {
          question.answer = option.title;
        }
      });
    });
    notifyListeners();
  }
}
