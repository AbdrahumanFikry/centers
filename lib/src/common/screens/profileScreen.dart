import 'package:centers/src/common/components/profileAppBar.dart';
import 'package:centers/src/common/components/profileInfo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            ProfileAppBar(),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowGlow();
                  return true;
                },
                child: ListView(
                  children: <Widget>[
                    ProfileInfo(
                      icon: FontAwesomeIcons.user,
                      title: 'User name',
                      content: 'Mohammed Essam',
                    ),
                    ProfileInfo(
                      icon: Icons.mail_outline,
                      title: 'E-mail',
                      content: 'me6636366@gmail.com',
                    ),
                    ProfileInfo(
                      icon: FontAwesomeIcons.phone,
                      title: 'Phone number',
                      content: '01002228293',
                    ),
                    ProfileInfo(
                      icon: FontAwesomeIcons.venusMars,
                      title: 'Gender',
                      content: 'male',
                    ),
                    ProfileInfo(
                      icon: FontAwesomeIcons.userGraduate,
                      title: 'Grade',
                      content: 'level 2',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 7.0,
          child: Icon(
            FontAwesomeIcons.signOutAlt,
          ),
          onPressed: () {
            //TODO -----SignOut-------
          },
        ),
      ),
    );
  }
}
