import 'package:centers/src/common/components/clippers/loginClipper.dart';
import 'package:centers/src/common/components/errorViewer.dart';
import 'package:centers/src/common/components/inputWidget.dart';
import 'package:centers/src/common/components/pageRoute.dart';
import 'package:centers/src/common/providers/authenticationProvider.dart';
import 'package:centers/src/common/screens/registerScreen.dart';
import 'package:centers/src/common/screens/resetPasswordScreen.dart';
import 'package:centers/src/student/ui/studentMainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  void _skip(BuildContext context) {
    Navigator.of(context).push(
      FadeRoute(
        page: StudentMainScreen(),
      ),
    );
  }

  void _resetPassword(BuildContext context) {
    Navigator.of(context).push(
      FadeRoute(
        page: ResetPasswordScreen(),
      ),
    );
  }

  void _signUp(BuildContext context) {
    Navigator.of(context).push(
      FadeRoute(
        page: RegisterScreen(),
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
                    'Login',
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
                  Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: LoginClipper(),
                        child: Consumer<Auth>(
                          builder: (context, loginData, _) => Hero(
                            tag: 'signUp',
                            child: Container(
                              width: screen.size.width > 600
                                  ? 550.0
                                  : screen.size.width * 0.90,
                              height: screen.size.height > 850
                                  ? 550
                                  : screen.size.height * 0.65,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Consumer<Auth>(
                        builder: (context, loginData, _) => Container(
                          width: screen.size.width > 600
                              ? 550.0
                              : screen.size.width * 0.90,
                          height: screen.size.height > 850
                              ? 550
                              : screen.size.height * 0.65,
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                            vertical: 22.5,
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: screen.size.height > 600
                                    ? 50.0
                                    : loginData.hasError ? 1.0 : 20.0,
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
                                  loginData.isLoading
                                      ? Padding(
                                          padding: const EdgeInsets.all(
                                            10.0,
                                          ),
                                          child: CircularProgressIndicator(),
                                        )
                                      : RaisedButton(
                                          shape: CircleBorder(),
                                          onPressed: () => _login(context),
                                          elevation: 5.0,
                                          padding: EdgeInsets.symmetric(
                                            vertical: screen.size.height < 600
                                                ? 10.0
                                                : 20.0,
                                          ),
                                          color: Colors.indigo[900],
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
                    ],
                  ),
                  InkWell(
                    onTap: () => _resetPassword(context),
                    child: Text(
                      'Forget password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                        decorationStyle: TextDecorationStyle.dotted,
                        fontSize: screen.size.height > 800 ? 22.0 : 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Don\'t have account ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cairo',
                            decorationStyle: TextDecorationStyle.dotted,
                            fontSize: screen.size.height > 800 ? 20.0 : 14.0,
                          ),
                        ),
                        InkWell(
                          onTap: () => _signUp(context),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Cairo',
                              decoration: TextDecoration.underline,
                              fontSize: screen.size.height > 800 ? 22.0 : 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () => _skip(context),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Cairo',
                              decorationStyle: TextDecorationStyle.dotted,
                              fontSize: screen.size.height > 800 ? 32.0 : 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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
