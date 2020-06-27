import 'package:centers/src/student/component/examScreen/question.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:centers/src/student/providers/studentProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<StudentProvider>(context, listen: false).pageController =
        PageController(
      initialPage:
          Provider.of<StudentProvider>(context, listen: false).pageIndex,
      keepPage: true,
      viewportFraction: 1,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Consumer<StudentData>(
            builder: (context, data, _) => PageView.builder(
              controller: Provider.of<StudentProvider>(context, listen: false)
                  .pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.examToAnswer.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: data.examToAnswer[index],
                  child: Question(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
