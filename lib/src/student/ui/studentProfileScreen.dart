import 'package:centers/src/student/component/profileScreen/profileAppBar.dart';
import 'package:flutter/material.dart';
import 'package:centers/src/student/component/profileScreen/profileInfo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class StudentProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Material(
              child: CustomScrollView(
                slivers: <Widget>[
                SliverPersistentHeader(
                    delegate: ProfileAppBar(
                      title: 'Profile',
                    ),
                  pinned: true,
                ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: 80.0,
                        ),
                        ProfileInfo(
                          icon: FaIcon(FontAwesomeIcons.user,color: Colors.indigo,size: 35,),
                          //icon: Icon(Icons.person,color: Colors.indigo,size: 35,),
                          title: 'Mohammed Essam',
                        ),
                        ProfileInfo(
                          icon: Icon(Icons.mail_outline,color: Colors.indigo,size: 35,),
                          //icon: Image.asset('assets/images/emailIcon.png',width: 35,height: 35,),
                          title: 'me6636366@gmail.com',
                        ),
                        ProfileInfo(
                          icon: FaIcon(FontAwesomeIcons.phone,color: Colors.indigo,size: 35,),
                          //icon: Icon(Icons.phone,color: Colors.indigo,size: 35,),
                          title: '01002228293',
                        ),
                        ProfileInfo(
                          icon: Image.asset('assets/images/maleAvatar.png',width: 35,height: 35,),
                          title: 'male',
                        ),
                        ProfileInfo(
                          icon: Icon(Icons.supervised_user_circle,color: Colors.indigo,size: 35,),
                          title: 'level 2',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
