import 'package:centers/src/common/components/clippers/loginClipper.dart';
import 'package:centers/src/common/components/errorViewer.dart';
import 'package:centers/src/common/components/timerPainter.dart';
import 'package:centers/src/common/providers/authenticationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';

class VerificationCodeScreen extends StatefulWidget {
  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen>
    with TickerProviderStateMixin {
  Auth timer;

  @override
  void initState() {
    timer = Provider.of<Auth>(context, listen: false);
    timer.timerController = AnimationController(
      vsync: this,
      duration: Duration(
        minutes: 1,
      ),
    );
    timer.startStopTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.timerController
      ..stop()
      ..dispose();
    super.dispose();
  }

  void _resendCode() {
    timer.startStopTimer();
    //TODO/////////////////
  }

  void _verify(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
//    await Provider.of<Auth>(context, listen: false).login();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: Provider.of<Auth>(context, listen: false).verifyScreenFormKey,
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
                    'Verify',
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
                            PinCodeTextField(
                              pinBoxWidth:
                                  screen.size.width > 400.0 ? 70.0 : 50.0,
                              pinBoxHeight:
                                  screen.size.width > 400.0 ? 70.0 : 50.0,
                              pinBoxRadius: 10.0,
                              highlight: true,
                              highlightColor: Colors.indigo[900],
                              defaultBorderColor: Colors.grey[300],
                              pinBoxColor: Colors.grey[100],
                              hasTextBorderColor: Colors.blue,
                              maxLength: 4,
                              errorBorderColor: Theme.of(context).errorColor,
                              onDone: null,
                              pinBoxDecoration: ProvidedPinBoxDecoration
                                  .defaultPinBoxDecoration,
                              pinTextStyle: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                              pinTextAnimatedSwitcherTransition:
                                  ProvidedPinBoxTextAnimation.scalingTransition,
                              pinTextAnimatedSwitcherDuration:
                                  Duration(milliseconds: 200),
                              highlightAnimationBeginColor: Colors.black,
                              highlightAnimationEndColor: Colors.white12,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            AnimatedBuilder(
                              animation: loginData.timerController,
                              builder: (context, child) => Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.0,
                                ),
                                child: loginData.timerString == '00:00'
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          FlatButton(
                                            onPressed: _resendCode,
                                            color: Colors.grey[200],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0,
                                              ),
                                              child: Text(
                                                'Resend code',
                                                style: TextStyle(
                                                  color: Colors.indigo,
                                                  fontFamily: 'Cairo',
                                                  decorationStyle:
                                                      TextDecorationStyle
                                                          .dotted,
                                                  fontSize:
                                                      screen.size.height > 800
                                                          ? 24.0
                                                          : 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        height: screen.size.height > 800
                                            ? 120.0
                                            : 80.0,
                                        width: screen.size.height > 800
                                            ? 120.0
                                            : 80.0,
                                        child: Align(
                                          alignment: FractionalOffset.center,
                                          child: AspectRatio(
                                            aspectRatio: 1.0,
                                            child: Stack(
                                              children: <Widget>[
                                                Positioned.fill(
                                                  child: CustomPaint(
                                                    painter: CustomTimerPainter(
                                                      animation: loginData
                                                          .timerController,
                                                      backgroundColor:
                                                          Colors.grey[200],
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      FractionalOffset.center,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        loginData.timerString,
                                                        style: TextStyle(
                                                          fontSize: screen.size
                                                                      .height >
                                                                  800
                                                              ? 24.0
                                                              : 18.0,
                                                          color: Colors.black,
                                                          fontFamily: 'Cairo',
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
                                        onPressed: () => _verify(context),
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
