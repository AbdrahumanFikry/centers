import 'package:flutter/material.dart';
import 'package:centers/src/student/component/studentCategories/absenceItem.dart';
class AbsenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absence',style: TextStyle(color: Colors.black, fontFamily: 'Cairo',),),
        centerTitle: true,
        backgroundColor: Colors.white
      ),
      body: GridView.builder(
        itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            return AbsenceItem(
              name: 'Math',
              center: '70',
              radius: 100.0,
              lineWidth: 6.0,
              percent: 0.7,
            );
          }
      ),
    );
  }
}
