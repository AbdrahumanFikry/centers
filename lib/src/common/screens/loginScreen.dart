import 'file:///F:/Flutter_Projects/centers/lib/src/common/components/clip.dart';
import 'package:centers/src/admin/ui/dashboard.dart';
import 'package:centers/src/common/components/inputWidget.dart';
import 'package:centers/src/common/components/pageRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  void _skip(BuildContext context) {
    Navigator.of(context).push(
      FadeRoute(
        page: DashBoardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo[900].withBlue(50),
                  Colors.indigo[700],
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: ScreenUtil.screenWidth > 1750
                        ? ScreenUtil().setSp(40, allowFontScalingSelf: true)
                        : ScreenUtil().setSp(60, allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ClipPath(
                  clipper: LoginClipper(),
                  child: Container(
                    width: ScreenUtil.screenWidth > 400
                        ? 360
                        : MediaQuery.of(context).size.width * 0.90,
                    height: ScreenUtil.screenHeight > 500
                        ? 550
                        : MediaQuery.of(context).size.height * 0.65,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 22.5,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40.0,
                        ),
                        InputWidget(
                          labelText: 'Email',
                          hintText: 'Enter your ID or Email',
                          isPassword: false,
                          onSaved: null,
                          validator: null,
                        ),
                        InputWidget(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          isPassword: true,
                          onSaved: null,
                          validator: null,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {},
                              child: Icon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () => _skip(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cairo',
                            decorationStyle: TextDecorationStyle.dotted,
                            fontSize: ScreenUtil.screenWidth > 1750
                                ? ScreenUtil()
                                    .setSp(40, allowFontScalingSelf: true)
                                : ScreenUtil()
                                    .setSp(45, allowFontScalingSelf: true),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
