import 'package:centers/src/common/components/examsScreen/examCell.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class ExamsList extends StatelessWidget {
  final bool isFinished;

  ExamsList({
    this.isFinished = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Consumer<StudentData>(
        builder: (context, data, _) => ListView.builder(
          itemCount:
              isFinished ? data.finishedExams.length : data.earlierExams.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: ChangeNotifierProvider.value(
                    value: isFinished
                        ? data.finishedExams[index]
                        : data.earlierExams[index],
                    child: ExamCell(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
