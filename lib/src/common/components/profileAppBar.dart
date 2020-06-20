import 'package:centers/src/common/components/clippers/profileClipper.dart';
import 'package:centers/src/common/components/pageRoute.dart';
import 'package:centers/src/common/screens/profileEditingScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Stack(
      children: [
        Container(
          height: 180.0,
          width: screen.size.width,
          color: Colors.transparent,
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          left: 0.0,
          child: ClipPath(
            clipper: ProfileClipper(),
            child: Container(
              height: 180.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[300],
                    Colors.blue[900],
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.userEdit,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        FadeRoute(
                          page: EditingProfileScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cairo',
                    fontSize: 26.0,
                  ),
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 60,
          right: 50.0,
          child: Hero(
            tag: 'Profile',
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage(
                'assets/images/user.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
