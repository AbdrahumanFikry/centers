import 'package:centers/src/common/components/globalButton.dart';
import 'package:centers/src/common/components/inputWidget.dart';
import 'package:centers/src/common/components/profileImageHandler.dart';
import 'package:flutter/material.dart';

class EditingProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          centerTitle: true,
          title: Text(
            'Edit profile',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowGlow();
            return true;
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            children: <Widget>[
              ProfileImageHandler(),
              InputWidget(
                editing: true,
                labelText: 'User name',
                hintText: 'Mohammed Essan',
              ),
              InputWidget(
                editing: true,
                labelText: 'E-mail',
                hintText: 'essam@gmail.com',
              ),
              InputWidget(
                editing: true,
                labelText: 'Phone',
                hintText: '01015629592',
              ),
              InputWidget(
                editing: true,
                labelText: 'gender',
                hintText: 'Male',
              ),
              InputWidget(
                editing: true,
                labelText: 'Grade',
                hintText: 'Level 2',
              ),
              GlobalButton(
                title: 'Update profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
