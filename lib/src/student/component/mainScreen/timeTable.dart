import 'package:carousel_slider/carousel_slider.dart';
import 'package:centers/src/data/weekDays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'file:///E:/Flutter_Projects/centers/lib/src/student/component/mainScreen/dayScheduler.dart';

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
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
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: RotatedBox(
                    quarterTurns: 75,
                    child: Text(
                      'Timeline',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: 'Cairo',
                        fontSize: ScreenUtil().setSp(
                          screen.size.width > 500 ? 26 : 34,
                          allowFontScalingSelf: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            NotificationListener<OverscrollIndicatorNotification>(
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
                  initialPage: 0,
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
          ],
        ),
      ),
    );
  }
}
