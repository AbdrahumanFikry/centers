import 'package:centers/src/student/component/toDoScreen/toDoDay.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:centers/src/student/providers/studentProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class ToDoItemsHolder extends StatelessWidget {
  final bool isEarlier;

  ToDoItemsHolder({
    this.isEarlier = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Consumer<StudentData>(
        builder: (context, data, _) =>
            NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(
                  milliseconds: 500,
                ),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: ChangeNotifierProvider(
                      create: (_) => StudentProvider(),
                      child: ChangeNotifierProvider.value(
                        value: isEarlier
                            ? data.earlierToDo[index]
                            : data.comingToDo[index],
                        child: ToDoDay(
                          isEarlier: isEarlier,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
