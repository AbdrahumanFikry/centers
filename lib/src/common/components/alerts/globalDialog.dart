import 'package:flutter/material.dart';

class GlobalDialog extends StatelessWidget {
  final String header;
  final Widget content;

  GlobalDialog({
    this.content,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0.0),
      content: Stack(
        children: <Widget>[
          Container(
            width: screen.size.width > 400.0
                ? 400.0
                : MediaQuery.of(context).size.width * 0.95,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    header,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: screen.size.height > 600.0 ? 22.0 : 18.0,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //---------------------- Dialog content --------------------------
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: content,
                ),
              ],
            ),
          ),
//          Positioned(
//            top: 0.0,
//            left: MediaQuery.of(context).size.width * 0.5 - 80.0,
//            child: CircleAvatar(
//              radius: 40.0,
//              backgroundColor: Colors.red.withOpacity(0.8),
//              child: Icon(
//                FontAwesomeIcons.exclamation,
//                color: Colors.white,
//                size: 30.0,
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}
