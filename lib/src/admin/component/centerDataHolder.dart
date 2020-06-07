import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CenterDataHolder extends StatelessWidget {
  final String title;
  final int count;

  CenterDataHolder({
    this.title = 'user',
    this.count = 0,
  });

  @override
  Widget build(BuildContext context) {
    IconData itemIcon = FontAwesomeIcons.user;
    if (title == 'Labs') {
      itemIcon = FontAwesomeIcons.chalkboard;
    } else if (title == 'Teachers') {
      itemIcon = FontAwesomeIcons.chalkboardTeacher;
    } else if (title == 'Students') {
      itemIcon = FontAwesomeIcons.userGraduate;
    } else if (title == 'Workers') {
      itemIcon = FontAwesomeIcons.idCardAlt;
    } else {
      IconData itemIcon = FontAwesomeIcons.user;
    }

    return Container(
      width: ScreenUtil.screenWidth > 1750
          ? ScreenUtil().setWidth(185)
          : ScreenUtil().setWidth(250),
      margin: const EdgeInsets.only(
        right: 12.0,
        bottom: 5.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          12.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 2.0,
            offset: Offset(
              1.5,
              1.0,
            ),
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Cairo',
              fontSize: ScreenUtil.screenWidth > 1750
                  ? ScreenUtil().setSp(20, allowFontScalingSelf: true)
                  : ScreenUtil().setSp(30, allowFontScalingSelf: true),
            ),
          ),
          Spacer(),
          Icon(
            itemIcon,
            color: Colors.indigo[900],
            size: ScreenUtil.screenWidth > 1750
                ? ScreenUtil().setSp(50, allowFontScalingSelf: true)
                : ScreenUtil().setHeight(60),
          ),
          Spacer(),
          Text(
            count.toString(),
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Cairo',
              fontSize: ScreenUtil.screenWidth > 1750
                  ? ScreenUtil().setSp(32, allowFontScalingSelf: true)
                  : ScreenUtil().setSp(40, allowFontScalingSelf: true),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'person',
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Cairo',
              fontSize: ScreenUtil.screenWidth > 1750
                  ? ScreenUtil().setSp(15, allowFontScalingSelf: true)
                  : ScreenUtil().setSp(25, allowFontScalingSelf: true),
            ),
          ),
        ],
      ),
    );
  }
}
