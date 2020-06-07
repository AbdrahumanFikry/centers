import 'package:centers/src/admin/ui/dashboard.dart';
import 'file:///F:/Flutter_Projects/centers/lib/src/common/screens/loginScreen.dart';
import 'file:///F:/Flutter_Projects/centers/lib/src/common/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Center App',
      theme: ThemeData(
        primaryColor: Colors.blue[100],
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
