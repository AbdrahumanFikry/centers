import 'dart:ui';

import 'package:centers/src/common/components/inputWidget.dart';
import 'package:centers/src/common/providers/authenticationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  void _register(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
//    await Provider.of<Auth>(context, listen: false).login();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: Provider.of<Auth>(context, listen: false).registerFormKey,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Hero(
                tag: 'signUp',
                child: Container(
                  color: Colors.white,
                ),
              ),
              Consumer<Auth>(
                builder: (context, signData, _) => Container(
                  height: screen.size.height -
                      screen.padding.top -
                      screen.padding.bottom,
                  width: screen.size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: ListView(
                    children: <Widget>[
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.indigo[900],
                          fontFamily: 'Cairo',
                          fontSize: screen.size.height > 600 ? 30.0 : 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      InputWidget(
                        labelText: 'User name',
                        hintText: 'Enter your full name',
                        isPassword: false,
                        onSaved: signData.onSaveEmail,
                        validator: signData.emailValidator,
                        isLoading: signData.isLoading,
                      ),
                      InputWidget(
                        labelText: 'Email',
                        hintText: 'Enter your ID or Email',
                        isPassword: false,
                        onSaved: signData.onSaveEmail,
                        validator: signData.emailValidator,
                        isLoading: signData.isLoading,
                      ),
                      InputWidget(
                        labelText: 'Level',
                        hintText: 'Enter your ID or Email',
                        isPassword: false,
                        onSaved: signData.onSaveEmail,
                        validator: signData.emailValidator,
                        isLoading: signData.isLoading,
                      ),
                      InputWidget(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        isPassword: true,
                        onSaved: signData.onSavePassword,
                        validator: signData.passwordValidator,
                        isLoading: signData.isLoading,
                      ),
                      // TODO Alert Dialog /////////////
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
                                    color: Colors.indigo[900],
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Back',
                                    style: TextStyle(
                                      color: Colors.indigo[900],
                                      fontFamily: 'Cairo',
                                      fontSize: screen.size.height > 800
                                          ? 32.0
                                          : 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          signData.isLoading
                              ? Padding(
                                  padding: const EdgeInsets.all(
                                    10.0,
                                  ),
                                  child: CircularProgressIndicator(),
                                )
                              : RaisedButton(
                                  shape: CircleBorder(),
                                  onPressed: () => _register(context),
                                  elevation: 5.0,
                                  padding: const EdgeInsets.all(
                                    20.0,
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
        ),
      ),
    );
  }
}
