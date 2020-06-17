import 'package:centers/src/common/components/globalAppBar.dart';
import 'package:centers/src/student/component/examsScreen/examsList.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: GlobalAppBar(
                title: 'Exams',
                component: Consumer<StudentData>(
                  builder: (context, data, _) => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            data.finished.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                          Text(
                            'Finished',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontFamily: 'Cairo',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: <Widget>[
                          Text(
                            data.earlier.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                          Text(
                            'earlier',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
