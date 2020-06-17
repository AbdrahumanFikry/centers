import 'package:centers/src/student/component/absenceScreen/abcenceHeader.dart';
import 'package:centers/src/student/component/absenceScreen/absenceList.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AbsenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          elevation: 0.0,
          title: Text(
            'Absence',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            AbsenceList(),
            Consumer<StudentData>(
              builder: (context, data, _) => AbsenceHeader(
                materials: data.materialAbsence.length,
                warnings: data.warningCount(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
