import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String title;
  final Color buttonColor;

  GlobalButton({
    this.title = 'Button',
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          50.0,
        ),
      ),
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 20.0,
      ),
      child: Container(
        height: 50.0,
        width: screen.size.width > 400 ? 400.0 : screen.size.width,
        decoration: BoxDecoration(
          color: buttonColor,
          gradient: buttonColor != null
              ? null
              : LinearGradient(
                  colors: [
                    Colors.blue[500],
                    Colors.blue[900],
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
          borderRadius: BorderRadius.circular(
            50.0,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
