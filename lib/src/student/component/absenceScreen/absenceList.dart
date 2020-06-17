import 'package:centers/src/student/component/absenceScreen/absenceCell.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class AbsenceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return true;
        },
        child: Consumer<StudentData>(
          builder: (context, data, _) => ListView.builder(
            itemCount: data.materialAbsence.length,
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
                      value: data.materialAbsence[index],
                      child: AbsenceCell(),
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
