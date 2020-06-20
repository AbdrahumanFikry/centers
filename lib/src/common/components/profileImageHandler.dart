import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileImageHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Center(
            child: Hero(
              tag: 'Profile',
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage(
                  'assets/images/user.png',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15.0,
            left: (MediaQuery.of(context).size.width * 0.5) - 10.0,
            child: InkWell(
              onTap: () {
                //TODO-----OpenCamera || Gallery--------
              },
              child: Card(
                shape: CircleBorder(),
                elevation: 10.0,
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.cameraRetro,
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
