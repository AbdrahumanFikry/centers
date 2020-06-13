import 'package:carousel_slider/carousel_slider.dart';
import 'package:centers/src/data/weekDays.dart';
import 'package:centers/src/student/component/dayScheduler.dart';
import 'package:flutter/material.dart';

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
//    List<Widget> days = [
//      DayScheduler(),
//      DayScheduler(),
//      DayScheduler(),
//      DayScheduler(),
//      DayScheduler(),
//    ];
    return Expanded(
      child: Container(
        width: screen.size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              40.0,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          top: 25.0,
        ),
        margin: const EdgeInsets.only(
          top: 15.0,
        ),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 10,
              enlargeCenterPage: false,
              height: double.infinity,
              enableInfiniteScroll: false,
              initialPage: 1,
              autoPlay: false,
            ),
            items: days.map((day) {
              int index = days.indexWhere((element) => element == day);
              return DayScheduler(
                index: index,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
