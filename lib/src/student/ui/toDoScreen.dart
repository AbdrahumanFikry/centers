import 'package:centers/src/student/component/toDoScreen/toDoItemsHolder.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // Screen AppBar
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
                    'ToDo',
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
                          data.toDos.length.toString(),
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
            // Screen body
            Expanded(
              child: Consumer<StudentData>(
                builder: (context, data, _) => ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                      child: data.earlierToDo.isEmpty
                          ? SizedBox()
                          : Row(
                              children: <Widget>[
                                Text(
                                  'Earlier',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Cairo',
                                    fontSize: 25.0,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  data.earlierToDo.length.toString(),
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    data.earlierToDo.isEmpty
                        ? SizedBox()
                        : ToDoItemsHolder(
                            isEarlier: true,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                      child: data.comingToDo.isEmpty
                          ? SizedBox()
                          : Row(
                              children: <Widget>[
                                Text(
                                  'Coming',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Cairo',
                                    fontSize: 25.0,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  data.comingToDo.length.toString(),
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    data.comingToDo.isEmpty
                        ? SizedBox()
                        : ToDoItemsHolder(
                            isEarlier: false,
                          ),
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
