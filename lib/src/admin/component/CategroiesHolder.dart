import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryHolder extends StatelessWidget {
  final String title;
  final int count;

  CategoryHolder({
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
      height: ScreenUtil().setHeight(175),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        vertical: 7.0,
        horizontal: 12.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          5.0,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            itemIcon,
            color: Colors.indigo[900],
            size: ScreenUtil().setHeight(45),
          ),
          const SizedBox(
            width: 30.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Cairo',
              fontSize: ScreenUtil().setSp(
                ScreenUtil.screenWidth > 1750 ? 40 : 50,
                allowFontScalingSelf: true,
              ),
            ),
          ),
          Spacer(),
          Text(
            count.toString(),
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Cairo',
              fontSize: ScreenUtil().setSp(40, allowFontScalingSelf: true),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
