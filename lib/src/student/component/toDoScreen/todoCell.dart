import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:centers/src/student/ui/toDoScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TODOCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        Provider.of<StudentData>(context, listen: false).filterToDo();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ToDoScreen(),
          ),
        );
      },
      child: Container(
        height: double.infinity,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Todo',
              style: TextStyle(
                color: Colors.indigo[900],
                fontFamily: 'Cairo',
                fontSize: screen.size.width > 600 ? 24 : 20,
              ),
            ),
            Spacer(),
            CircleAvatar(
              backgroundColor: Colors.yellowAccent.withRed(5),
              radius: 15.0,
              child: Consumer<StudentData>(
                builder: (context, data, _) => Text(
                  data.toDos.length.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Cairo',
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
