import 'package:centers/src/common/components/timerPainter.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:centers/src/student/providers/studentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExamProgress extends StatefulWidget {
  @override
  _ExamProgressState createState() => _ExamProgressState();
}

class _ExamProgressState extends State<ExamProgress>
    with TickerProviderStateMixin {
  StudentProvider timer;

  @override
  void initState() {
    timer = Provider.of<StudentProvider>(context, listen: false);
    timer.timerController = AnimationController(
      vsync: this,
      duration: Duration(
        minutes: 2,
      ),
    );
    timer.startStopTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.timerController
      ..stop()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 25.0,
      ),
      child: Consumer<StudentProvider>(
        builder: (context, data, _) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Consumer<StudentData>(
              builder: (context, questions, _) => Text(
                'Question ${data.pageIndex + 1} of ${questions.examToAnswer.length}',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Spacer(),
            AnimatedBuilder(
              animation: data.timerController,
              builder: (context, child) => Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 70.0,
                  width: 70.0,
                  child: Align(
                    alignment: FractionalOffset.center,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: CustomPaint(
                              painter: CustomTimerPainter(
                                animation: data.timerController,
                                backgroundColor: Colors.grey[200],
                                color: Duration(
                                                minutes: int.tryParse(data
                                                    .countTimer
                                                    .split(':')[0]),
                                                seconds: int.tryParse(data
                                                    .countTimer
                                                    .split(':')[1]))
                                            .inSeconds <=
                                        30
                                    ? Theme.of(context).errorColor
                                    : Colors.green,
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Duration(
                                                minutes: int.tryParse(data
                                                    .countTimer
                                                    .split(':')[0]),
                                                seconds: int.tryParse(data
                                                    .countTimer
                                                    .split(':')[1]))
                                            .inSeconds <=
                                        30
                                    ? Text(
                                        data.timerString.split(':')[1],
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontFamily: 'Cairo',
                                        ),
                                      )
                                    : Text(
                                        data.timerString,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                          fontFamily: 'Cairo',
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
