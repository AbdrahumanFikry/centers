import 'package:centers/src/common/components/pageRoute.dart';
import 'package:centers/src/models/chat.dart';
import 'package:centers/src/student/ui/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cellData = Provider.of<Chat>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          FadeRoute(
            page: ChatScreen(),
          ),
        );
      },
      child: Container(
        height: 80.0,
        width: double.infinity,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('assets/images/maleAvatar.png'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        cellData.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontWeight: cellData.read ? null : FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Text(
                        cellData.date,
                        style: TextStyle(
                          color: cellData.read ? Colors.grey : Colors.black,
                          fontFamily: 'Cairo',
                          fontSize: 14.0,
                          fontWeight: cellData.read ? null : FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    cellData.lastMessage,
                    style: TextStyle(
                      color: cellData.read ? Colors.grey : Colors.black,
                      fontFamily: 'Cairo',
                      fontSize: 14.0,
                      fontWeight: cellData.read ? null : FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
