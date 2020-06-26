import 'package:centers/src/models/examToAnswerModel.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionHandler extends StatelessWidget {
  final String answer;

  OptionHandler({
    this.answer,
  });

  @override
  Widget build(BuildContext context) {
    final optionData = Provider.of<Option>(context);
    MediaQueryData screen = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        Provider.of<StudentData>(context, listen: false)
            .answer(answerId: optionData.id);
      },
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50.0,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 7.0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 15.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              50.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              optionData.title == answer
                  ? CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 12.0,
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 12.0,
                    ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                optionData.title,
                style: TextStyle(
                  color:
                      optionData.title == answer ? Colors.green : Colors.black,
                  fontFamily: 'Cairo',
                  fontSize: screen.size.height > 600 ? 22.0 : 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
