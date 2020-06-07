import 'package:centers/src/admin/component/centerData.dart';
import 'package:centers/src/admin/component/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'Hello';
    int hour = DateTime.now().hour;
    if (hour <= 11) {
      title = 'Good morning';
    } else if (hour > 11 && hour <= 14) {
      title = 'Good afternoon';
    } else if (hour > 14) {
      title = 'Good night';
    } else {
      title = 'Hello';
    }
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height - 105,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Text(
              '$title, Admin',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: ScreenUtil.screenWidth > 1750
                    ? ScreenUtil().setSp(40, allowFontScalingSelf: true)
                    : ScreenUtil().setSp(55, allowFontScalingSelf: true),
              ),
            ),
          ),
          CenterData(),
          Chart(),
        ],
      ),
    );
  }
}
