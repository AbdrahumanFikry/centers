import 'package:centers/src/common/components/pageRoute.dart';
import 'package:centers/src/common/screens/examsScreen.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:centers/src/student/ui/absenceScreen.dart';
import 'package:centers/src/student/ui/messagesScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class StudentCategoryHolder extends StatelessWidget {
  final int notification;
  final String title;
  final IconData avatar;

  StudentCategoryHolder({
    this.notification = 0,
    this.title = 'title',
    this.avatar = FontAwesomeIcons.info,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        if (title == 'Absence') {
          Navigator.of(context).push(
            FadeRoute(
              page: AbsenceScreen(),
            ),
          );
        } else if (title == 'Exam') {
          Provider.of<StudentData>(context, listen: false)
            ..fetchEarlierExams()
            ..fetchFinishedExams();
          Navigator.of(context).push(
            FadeRoute(
              page: ExamsScreen(),
            ),
          );
        } else if (title == 'Messages') {
          Navigator.of(context).push(
            FadeRoute(
              page: MessagesScreen(),
            ),
          );
        }
      },
      child: Container(
        height: 100,
        width:
            screen.size.width > 500 ? 500 : MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          vertical: 7.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              avatar,
              color: Colors.indigo[900],
              size: 22.0,
            ),
            const SizedBox(
              width: 25.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.indigo[900],
                fontFamily: 'Cairo',
                fontSize: 28,
              ),
            ),
            const Spacer(),
            notification > 0
                ? CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Theme.of(context).errorColor,
                    child: FittedBox(
                      child: Text(
                        notification.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    width: 1.0,
                  ),
            const SizedBox(
              width: 15.0,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.indigo[900],
              size: 28.0,
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
