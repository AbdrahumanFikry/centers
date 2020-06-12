import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  String _email;
  String _password;
  bool isLoading = false;
  bool hasError = false;
  String error = 'An error occurred!';
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  String emailValidator(value) {
    if (value.isEmpty) {
      return 'Invalid email!';
    }
    return null;
  }

  String passwordValidator(value) {
    if (value.isEmpty) {
      return 'password is too short!';
    } else if (value.length < 6) {
      return 'password should be at least 8 character!';
    }
    return null;
  }

  void onSaveEmail(value) {
    _email = value;
    notifyListeners();
  }

  void onSavePassword(value) {
    _password = value;
    notifyListeners();
  }

  void loading({bool status}) {
    isLoading = status;
    notifyListeners();
  }

  void errorState({bool status, String title}) {
    hasError = status;
    error = title;
    notifyListeners();
  }

  Future<void> login() async {
    errorState(status: false);
    const url = 'https://api.hmto-eleader.com/oauth/token';
    final formData = loginFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      loading(status: true);
      try {
        var body = {
          'username': _email,
          'password': _password,
          'grant_type': 'password',
          'client_id': '2',
          'client_secret': '83mW91iXZenucUT4paaGuDNnNL29OFp19EDN80CY',
        };
        final response = await http.post(
          url,
          body: body,
        );
        print("Response :" + response.body.toString());
        if (response.body.contains('error')) {
          errorState(status: true);
        }
        loading(status: false);
      } catch (error) {
        errorState(status: true, title: error.toString());
        loading(status: false);
      }
    }
  }
}
