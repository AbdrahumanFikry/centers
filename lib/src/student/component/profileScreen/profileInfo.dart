import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final Widget icon;
  final String title;
  ProfileInfo({
    this.icon,this.title
});
  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              icon,
              SizedBox(width: 10.0,),
              Text(title,style: TextStyle(
                color: Colors.black,
                fontFamily: 'Cairo',
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        );
  }
}
