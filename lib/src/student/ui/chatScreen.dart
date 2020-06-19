import 'package:centers/src/student/component/messagesScreen/messageHandler.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Consumer<StudentData>(
                          builder: (context, data, _) => NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (overScroll) {
                              overScroll.disallowGlow();
                              return true;
                            },
                            child: ListView(
                              reverse: true,
                              padding: EdgeInsets.only(
                                top: 8.0,
                                right: 8.0,
                                left: 8.0,
                              ),
                              children: [
                                ...data.messages,
                                SizedBox(
                                  height: 65.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      MessageHandler(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white.withOpacity(
                  0.9,
                ),
                padding: const EdgeInsets.only(
                  right: 10.0,
                  left: 5.0,
                  top: 9.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.indigo,
                        size: 24.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Mohammed',
                      style: TextStyle(
                        color: Colors.indigo[400],
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 34.0,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
