import 'package:centers/src/student/component/examScreen/examBody.dart';
import 'package:centers/src/student/component/examScreen/examProgress.dart';
import 'package:centers/src/student/providers/studentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamScreen extends StatelessWidget {
  final String title;

  ExamScreen({
    this.title = 'Exam title',
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StudentProvider(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo[500],
            elevation: 2.0,
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            bottom: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                100.0,
              ),
              child: ExamProgress(),
            ),
          ),
          body: ExamBody(),
        ),
      ),
    );
  }
}
