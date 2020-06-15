import 'package:centers/src/models/absenceDay.dart';
import 'package:centers/src/student/component/absenceScreen/absenceDays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class AbsenceCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cellData = Provider.of<MaterialAbsence>(context);
    final double percent =
        1.0 - (cellData.daysAbsence / cellData.allDays).toDouble();
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 7.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 22.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                cellData.materialName,
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontFamily: 'Cairo',
                  fontSize: 28.0,
                ),
              ),
              Spacer(),
              CircularPercentIndicator(
                animation: true,
                animationDuration: 2,
                radius: 70.0,
                lineWidth: 5.0,
                percent: percent,
                center: Text(
                  percent <= 0.9
                      ? 'Warning'
                      : '${cellData.allDays - cellData.daysAbsence}/${cellData.allDays}',
                  style: TextStyle(
                    color: percent <= 0.9
                        ? Theme.of(context).errorColor
                        : Colors.green,
                    fontFamily: 'Cairo',
                  ),
                ),
                progressColor: percent <= 0.9
                    ? Theme.of(context).errorColor
                    : Colors.green,
              ),
            ],
          ),
          cellData.absenceDays.isNotEmpty
              ? Column(
                  children: <Widget>[
                    Divider(
                      color: Colors.black,
                      indent: 1.0,
                      height: 30.0,
                    ),
                    AbsenceDays(
                      days: cellData.absenceDays,
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
