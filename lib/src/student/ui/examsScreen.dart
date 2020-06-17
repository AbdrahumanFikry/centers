import 'package:centers/src/student/component/examsScreen/examsAppBar.dart';
import 'package:centers/src/student/component/examsScreen/examsList.dart';
import 'package:flutter/material.dart';

class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: ExamsAppBar(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Text(
                      'Earlier exams',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cairo',
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  ExamsList(
                    isFinished: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Text(
                      'Finished exams',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cairo',
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  ExamsList(
                    isFinished: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
