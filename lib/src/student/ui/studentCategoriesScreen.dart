import 'package:centers/src/models/centerDataModel.dart';
import 'package:centers/src/student/component/studentCategories/studentCategoryHolder.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    data[1].count =
        Provider.of<StudentData>(context, listen: false).readCount();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: screen.size.width > 500 ? 500 : screen.size.width,
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
                      fontSize: 24.0,
                    ),
                  ),
                ),
                AnimationLimiter(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
