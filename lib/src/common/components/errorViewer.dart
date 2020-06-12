import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorViewer extends StatelessWidget {
  final String error;

  ErrorViewer({
    this.error = 'An error occurred!',
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
            7.5,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 7.5,
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: 10.0,
              decoration: BoxDecoration(
                color: Theme.of(context).errorColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    7.5,
                  ),
                  topLeft: Radius.circular(
                    7.5,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  error,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontFamily: 'Cairo',
                    fontSize: ScreenUtil().setSp(
                      screen.size.height < 800 ? 30.0 : 20.0,
                      allowFontScalingSelf: true,
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
