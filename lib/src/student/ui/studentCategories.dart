import 'package:centers/src/models/centerDataModel.dart';
import 'package:centers/src/student/component/studentCategories/studentCategoryHolder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentCategories extends StatelessWidget {
  final List<CenterDataModel> data = [
    CenterDataModel(
      title: 'Absence',
      count: 0,
      avatar: FontAwesomeIcons.addressBook,
    ),
    CenterDataModel(
      title: 'Messages',
      count: 2,
      avatar: FontAwesomeIcons.facebookMessenger,
    ),
    CenterDataModel(
      title: 'Exam',
      count: 0,
      avatar: FontAwesomeIcons.tasks,
    ),
    CenterDataModel(
      title: 'Sign out',
      count: 0,
      avatar: FontAwesomeIcons.signOutAlt,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: screen.size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
//            borderRadius: BorderRadius.only(
//              topRight: Radius.circular(
//                40.0,
//              ),
//            ),
          ),
          padding: const EdgeInsets.only(
            top: 10.0,
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5.0,
                  ),
                  child: Text(
                    'Choose activity',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Cairo',
                      fontSize: ScreenUtil().setSp(
                        screen.size.width > 500 ? 24 : 44,
                        allowFontScalingSelf: true,
                      ),
                    ),
                  ),
                ),
                AnimationLimiter(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: StudentCategoryHolder(
                                title: data[index].title,
                                notification: data[index].count,
                                avatar: data[index].avatar,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
