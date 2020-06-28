import 'dart:io';

import 'package:centers/src/common/components/alerts/globalDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalAlertDialog {
  static void show({
    @required String dialogContent,
    @required BuildContext context,
    @required Function onTap,
  }) {
    MediaQueryData screen = MediaQuery.of(context);
    if (Platform.isIOS) {
      showDialog(
        context: context,
        child: CupertinoAlertDialog(
          title: Text(
            dialogContent,
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                'Yes',
              ),
              textStyle: TextStyle(
                color: Colors.indigo,
              ),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                onTap();
              },
            ),
            CupertinoDialogAction(
              child: Text(
                'Cancel',
              ),
              textStyle: TextStyle(
                color: Colors.red,
              ),
              isDefaultAction: true,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => GlobalDialog(
          header: 'Alert',
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  dialogContent,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screen.size.height > 600.0 ? 20.0 : 18.0,
                    fontFamily: 'Cairo',
                  ),
                  softWrap: true,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        onTap();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: screen.size.height > 600.0 ? 22.0 : 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: screen.size.height > 600.0 ? 22.0 : 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
