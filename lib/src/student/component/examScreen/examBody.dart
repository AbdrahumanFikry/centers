import 'package:flutter/material.dart';

class ExamBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.white : Colors.green,
              );
            },
          ),
        ),
      ],
    );
  }
}
