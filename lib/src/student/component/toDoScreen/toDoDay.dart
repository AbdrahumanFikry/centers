import 'package:centers/src/student/component/toDoScreen/toDoViewer.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:centers/src/student/providers/studentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoDay extends StatelessWidget {
  final bool isEarlier;

  ToDoDay({
    this.isEarlier = false,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    double constantFactor = screen.size.height > 600 ? 160.0 : 120.0;
    final dayData = Provider.of<StudentData>(context);
    final itemData = isEarlier ? dayData.earlierToDo : dayData.comingToDo;
    return Consumer<StudentProvider>(
      builder: (context, ui, _) => GestureDetector(
        onTap: () {
          ui.expand(
            itemLength: itemData.length,
            constantLength: constantFactor,
          );
        },
        child: AnimatedContainer(
          height: ui.toDHeight,
          width: screen.size.width,
          duration: Duration(
            milliseconds: 300,
          ),
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 2.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 3.5,
                height: double.infinity - 50.0,
                color: isEarlier ? Colors.red : Colors.indigo[900],
              ),
              Expanded(
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    ...itemData
                        .map((item) {
                          int index = itemData.indexWhere(
                              (element) => element.title == item.title);
                          double position = 0.0;
                          if (ui.isExpanded) {
                            position = (index * constantFactor);
                          } else {
                            position =
                                (index * 8.0) >= 24.0 ? 24.0 : (index * 8.0);
                          }
                          return AnimatedPositioned(
                            top: position,
                            left: ui.isExpanded ? 5.0 : position,
                            duration: Duration(milliseconds: 320),
                            child: ChangeNotifierProvider.value(
                              value: itemData[index],
                              child: ToDoViewer(),
                            ),
                          );
                        })
                        .toList()
                        .reversed,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
