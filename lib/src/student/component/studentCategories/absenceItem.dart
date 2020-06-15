import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
class AbsenceItem extends StatelessWidget {
  final String name;
  final double radius;
  final double lineWidth;
  final double percent;
  final String center;
  AbsenceItem({this.name,this.center,this.lineWidth,this.percent,this.radius});
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      borderOnForeground: true,
      color: Colors.grey[100],
      child: GridTile(
        footer: Center(child: Text(name,style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo'
        ),)),
          child: CircularPercentIndicator(
            animation: true,
            animationDuration: 2,
            radius: radius,
            lineWidth: lineWidth,
            percent: percent,
            center: new Text(center),
            progressColor: percent<=0.4?Colors.red:Colors.green
          )
      ),
    );
  }
}
