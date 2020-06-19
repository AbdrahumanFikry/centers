import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MessageHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentData>(
      builder: (context, data, _) => Container(
        height: 70,
        width: double.infinity,
        color: Colors.white.withOpacity(
          0.5,
        ),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {},
              splashColor: Colors.indigo[500],
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 7.5,
                ),
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.indigo[500],
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: data.message,
                decoration: InputDecoration(
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  hintText: 'Type a message',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Cairo',
                  ),
                ),
                onChanged: (value) => data.typing(value),
                cursorColor: Colors.indigo,
                cursorWidth: 2.5,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Cairo',
                  fontSize: 16.0,
                ),
              ),
            ),
            InkWell(
              onTap: data.message.text.isEmpty
                  ? () {}
                  : () {
                      data.addMessage();
                    },
              splashColor: Colors.indigo[500],
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 7.5,
                  right: 15.0,
                ),
                child: Icon(
                  data.message.text.isEmpty
                      ? FontAwesomeIcons.paperPlane
                      : FontAwesomeIcons.solidPaperPlane,
                  color: Colors.indigo[500],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
