import 'package:flutter/material.dart';

class AbsenceHeader extends StatelessWidget {
  final int materials;
  final int warnings;

  AbsenceHeader({
    this.materials = 5,
    this.warnings = 1,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Stack(
      children: <Widget>[
        Container(
          height: 130.0,
          width: screen.size.width,
          color: Colors.transparent,
        ),
        Container(
          height: 90.0,
          width: screen.size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo[900],
                Colors.indigo[500],
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: Container(
            height: 80.0,
            width: screen.size.width > 550 ? 500 : screen.size.width,
            margin: EdgeInsets.symmetric(
              horizontal: screen.size.width * 0.05,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: Colors.white,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        materials.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        'Materials',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontFamily: 'Cairo',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Text(
                        warnings.toString(),
                        style: TextStyle(
                          color: warnings > 0
                              ? Theme.of(context).errorColor
                              : Colors.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        'Warnings',
                        style: TextStyle(
                          color: warnings > 0
                              ? Theme.of(context).errorColor
                              : Colors.indigo,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
