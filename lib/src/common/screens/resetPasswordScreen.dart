import 'package:centers/src/common/components/clippers/loginClipper.dart';
import 'package:centers/src/common/components/errorViewer.dart';
import 'package:centers/src/common/components/inputWidget.dart';
import 'package:centers/src/common/components/pageRoute.dart';
import 'package:centers/src/common/providers/authenticationProvider.dart';
import 'package:centers/src/common/screens/verificationCodeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  void _resetPassword(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    Navigator.of(context).pushReplacement(
      FadeRoute(
        page: VerificationCodeScreen(),
      ),
    );
//    await Provider.of<Auth>(context, listen: false).login();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: Provider.of<Auth>(context, listen: false).resetScreenFormKey,
          child: SingleChildScrollView(
            child: Container(
              height: screen.size.height -
                  screen.padding.top -
                  screen.padding.bottom,
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
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontSize: screen.size.height > 600 ? 30.0 : 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screen.size.height > 850 ? 45.0 : 10.0,
                  ),
                  ClipPath(
                    clipper: LoginClipper(),
                    child: Consumer<Auth>(
                      builder: (context, loginData, _) => Container(
                        width: screen.size.width > 600
                            ? 550.0
                            : screen.size.width * 0.90,
                        height: screen.size.height > 800
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
                              height: screen.size.height > 600
                                  ? 50.0
                                  : loginData.hasError ? 1.0 : 40.0,
                            ),
                            InputWidget(
                              labelText: 'Phone',
                              hintText: 'Enter your phone number',
                              isPassword: false,
                              onSaved: loginData.onSaveEmail,
                              validator: loginData.emailValidator,
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
                                loginData.isLoading
                                    ? Padding(
                                        padding: const EdgeInsets.all(
                                          10.0,
                                        ),
                                        child: CircularProgressIndicator(),
                                      )
                                    : FloatingActionButton(
                                        onPressed: () =>
                                            _resetPassword(context),
                                        backgroundColor: loginData.hasError
                                            ? Theme.of(context).errorColor
                                            : null,
                                        mini: screen.size.height > 550
                                            ? false
                                            : true,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            left: 10.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Back',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Cairo',
                                  decorationStyle: TextDecorationStyle.dotted,
                                  fontSize:
                                      screen.size.height > 800 ? 32.0 : 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
