import 'package:centers/src/student/component/messagesScreen/userHolder.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
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
                      Icons.arrow_back,
                      color: Colors.indigo,
                      size: 30.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Messages',
                    style: TextStyle(
                      color: Colors.indigo[400],
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: screen.size.height > 800 ? 36.0 : 30.0,
                    ),
                  ),
                  Spacer(),
                  Consumer<StudentData>(
                    builder: (context, data, _) => CircleAvatar(
                      backgroundColor: Colors.indigo[400],
                      radius: 15.0,
                      child: FittedBox(
                        child: Text(
                          data.readCount().toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AnimationLimiter(
                child: Consumer<StudentData>(
                  builder: (context, data, _) =>
                      NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: data.chats.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: ChangeNotifierProvider.value(
                                value: data.chats[index],
                                child: UserHolder(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
