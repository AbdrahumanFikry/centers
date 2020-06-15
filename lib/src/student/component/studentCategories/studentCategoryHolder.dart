import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentCategoryHolder extends StatelessWidget {
  final int notification;
  final String title;
  final IconData avatar;


  StudentCategoryHolder({
    this.notification = 0,
    this.title = 'title',
    this.avatar = FontAwesomeIcons.info,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Container(
      height: screen.size.width > 500 ? 110 : 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        vertical: 7.0,
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            avatar,
            color: Colors.indigo[900],
            size: ScreenUtil().setHeight(45),
          ),
          const SizedBox(
            width: 25.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Cairo',
              fontSize: ScreenUtil().setSp(
                screen.size.width > 500 ? 40 : 50,
                allowFontScalingSelf: true,
              ),
            ),
          ),
          const Spacer(),
          notification > 0
              ? CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Theme.of(context).errorColor,
                  child: FittedBox(
                    child: Text(
                      notification.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: 1.0,
                ),
          const SizedBox(
            width: 20.0,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.indigo[900],
            size: 28.0,
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
