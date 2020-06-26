import 'package:centers/src/models/examToAnswerModel.dart';
import 'package:centers/src/student/component/examScreen/options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    final questionData = Provider.of<ExamToAnswer>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 5.0,
        ),
        children: <Widget>[
          Text(
            questionData.type.toString().split('.')[1],
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Cairo',
              fontSize: screen.size.height > 600 ? 24.0 : 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          questionData.image == null
              ? SizedBox()
              : Image.asset(
                  questionData.image,
                  fit: BoxFit.contain,
                  height: screen.size.height > 600 ? 240.0 : 150.0,
                  width: double.infinity,
                ),
          Text(
            questionData.question,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontSize: screen.size.height > 600 ? 28.0 : 22.0,
            ),
            softWrap: true,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 15.0,
          ),
          ChangeNotifierProvider.value(
            value: questionData,
            child: Options(),
          ),
        ],
      ),
    );
  }
}
