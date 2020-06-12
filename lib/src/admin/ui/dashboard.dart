import 'package:centers/src/admin/component/adminAppBar.dart';
import 'package:centers/src/admin/provider/adminProvider.dart';
import 'package:centers/src/common/components/clippers/dashBoardClipper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminProvider(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Stack(
            children: <Widget>[
              ClipPath(
                clipper: DashBoardClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.indigo[900].withBlue(50),
                        Colors.indigo[700],
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              Consumer<AdminProvider>(
                builder: (context, body, _) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AdminAppBar(),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      //Enable this for ScaleTransition
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          child: child,
                          opacity: animation,
                        );
                      },
                      child: body.targetBody,
                    ),
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
