import 'package:centers/src/admin/component/centerDataHolder.dart';
import 'package:centers/src/models/centerDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CenterData extends StatelessWidget {
  final List<CenterDataModel> data = [
    CenterDataModel(
      title: 'Labs',
      count: 10,
    ),
    CenterDataModel(
      title: 'Teachers',
      count: 14,
    ),
    CenterDataModel(
      title: 'Students',
      count: 127,
    ),
    CenterDataModel(
      title: 'Workers',
      count: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(430),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return true;
        },
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 20.0,
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CenterDataHolder(
                  title: data[index].title,
                  count: data[index].count,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
