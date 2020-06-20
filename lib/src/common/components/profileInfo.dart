import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  ProfileInfo({
    this.icon,
    this.title = 'Null',
    this.content = 'Null',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      height: 60.0,
      child: Row(
        children: <Widget>[
          Card(
            shape: CircleBorder(),
            elevation: 10.0,
            child: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.indigo,
              child: Icon(icon),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Cairo',
                  fontSize: 14.0,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Cairo',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
