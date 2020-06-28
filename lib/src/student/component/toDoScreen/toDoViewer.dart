import 'package:centers/src/models/toDoModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ToDoViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    final itemData = Provider.of<ToDoModel>(context);
    return Container(
      height: screen.size.height > 600 ? 150 : 110,
      width: screen.size.width > 400 ? 350 : 275,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5.0,
            spreadRadius: 0.5,
            offset: Offset(
              2.5,
              3.5,
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            itemData.material,
            style: TextStyle(
              color: Colors.indigo[900],
              fontFamily: 'Cairo',
              fontSize: screen.size.height > 600 ? 18.0 : 14.0,
            ),
          ),
          Text(
            itemData.title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Cairo',
              fontSize: screen.size.height > 600 ? 22.0 : 18.0,
            ),
          ),
          Text(
            DateFormat('MMM ,d ,y').format(itemData.date),
            style: TextStyle(
              color: Colors.indigo,
              fontFamily: 'Cairo',
              fontSize: screen.size.height > 600 ? 18.0 : 14.0,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
