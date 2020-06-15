import 'package:centers/src/common/providers/authenticationProvider.dart';
import 'package:centers/src/common/screens/splashScreen.dart';
import 'package:centers/src/student/ui/absenceScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Center App',
        theme: ThemeData(
          primaryColor: Colors.blue[100],
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AbsenceScreen(),
      ),
    );
  }
}
