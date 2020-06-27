import 'package:centers/src/common/components/alerts/alertDialog.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:centers/src/student/providers/studentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Consumer<StudentData>(
      builder: (context, data, _) => Consumer<StudentProvider>(
        builder: (context, page, _) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            page.pageIndex == 0
                ? SizedBox(
                    width: 0.5,
                  )
                : Expanded(
                    child: GestureDetector(
                      onTap: () {
                        page.moveToPage(targetIndex: --page.pageIndex);
                      },
                      child: Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            bottomLeft: Radius.circular(50.0),
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 15.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                'Previous',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Cairo',
                                  fontSize:
                                      screen.size.height > 600 ? 20.0 : 16.0,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (page.pageIndex == data.examToAnswer.length - 1) {
                    GlobalAlertDialog.show(
                      context: context,
                      dialogContent:
                          'Are you sure you want to finish the exam?',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    );
                  } else {
                    page.moveToPage(targetIndex: ++page.pageIndex);
                  }
                },
                child: Card(
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 15.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                        Text(
                          page.pageIndex == data.examToAnswer.length - 1
                              ? 'Finish'
                              : 'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cairo',
                            fontSize: screen.size.height > 600 ? 20.0 : 16.0,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          page.pageIndex == data.examToAnswer.length - 1
                              ? Icons.done_all
                              : Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
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
