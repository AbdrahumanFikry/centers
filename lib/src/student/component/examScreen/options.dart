import 'package:centers/src/models/examToAnswerModel.dart';
import 'package:centers/src/student/component/examScreen/optionHandler.dart';
import 'package:centers/src/student/component/examScreen/pageSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final questionData = Provider.of<ExamToAnswer>(context);
    return Column(
      children: <Widget>[
        ListView.builder(
          itemCount: questionData.options.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: questionData.options[index],
              child: OptionHandler(
                answer: questionData.answer,
              ),
            );
          },
        ),
        PageSwitcher(),
      ],
    );
  }
}
