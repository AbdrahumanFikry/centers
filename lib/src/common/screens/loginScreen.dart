import 'package:centers/src/admin/ui/dashboard.dart';
import 'package:centers/src/common/components/clippers/loginClipper.dart';
import 'package:centers/src/common/components/errorViewer.dart';
import 'package:centers/src/common/components/inputWidget.dart';
import 'package:centers/src/common/components/pageRoute.dart';
import 'package:centers/src/common/providers/authenticationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  void _skip(BuildContext context) {
    Navigator.of(context).push(
      FadeRoute(
        page: DashBoardScreen(),
      ),
    );
  }

  void _login(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    await Provider.of<Auth>(context, listen: false).login();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: Provider.of<Auth>(context, listen: false).loginFormKey,
          child: SingleChildScrollView(
            child: Container(
              height: screen.size.height - screen.padding.top,
              width: screen.size.width,
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
                      fontSize: ScreenUtil().setSp(
                        ScreenUtil.screenWidth > 1750 ? 40 : 55,
                        allowFontScalingSelf: true,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ClipPath(
                    clipper: LoginClipper(),
                    child: Consumer<Auth>(
                      builder: (context, loginData, _) => Container(
                        width: screen.size.width > 400
                            ? 360
                            : screen.size.width * 0.90,
                        height: screen.size.height > 1000
                            ? 550
                            : screen.size.height * 0.65,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 22.5,
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: loginData.hasError ? 1.0 : 40.0,
                            ),
                            InputWidget(
                              labelText: 'Email',
                              hintText: 'Enter your ID or Email',
                              isPassword: false,
                              onSaved: loginData.onSaveEmail,
                              validator: loginData.emailValidator,
                              isLoading: loginData.isLoading,
                            ),
                            InputWidget(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              isPassword: true,
                              onSaved: loginData.onSavePassword,
                              validator: loginData.passwordValidator,
                              isLoading: loginData.isLoading,
                            ),
                            loginData.hasError
                                ? ErrorViewer()
                                : SizedBox(
                                    height: 5.0,
                                  ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FloatingActionButton(
                                  onPressed: () => _login(context),
                                  mini: screen.size.height > 550 ? false : true,
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
                              fontSize: ScreenUtil().setSp(
                                ScreenUtil.screenWidth > 1750 ? 40 : 45,
                                allowFontScalingSelf: true,
                              ),
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
      ),
    );
  }
}
