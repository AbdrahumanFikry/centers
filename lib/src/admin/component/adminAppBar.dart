import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:centers/src/admin/provider/adminProvider.dart';
import 'package:avatar_glow/avatar_glow.dart';

class AdminAppBar extends StatefulWidget {
  @override
  _AdminAppBarState createState() => _AdminAppBarState();
}

class _AdminAppBarState extends State<AdminAppBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminProvider>(context, listen: false).barAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<AdminProvider>(context, listen: false)
        .barAnimationController
        .dispose();
  }

  @override
  Widget build(BuildContext context) {
    String barTitle = 'Dashboard';
    if (Provider.of<AdminProvider>(context).isList) {
      barTitle = 'Categories';
    }
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Consumer<AdminProvider>(
        builder: (context, admin, _) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              tooltip: admin.isList ? 'menu' : 'categories',
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: admin.barAnimationController,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () => admin.handleListChanges(),
            ),
            Spacer(),
            Text(
              barTitle,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Cairo',
                fontSize: ScreenUtil().setSp(40, allowFontScalingSelf: true),
              ),
              textAlign: TextAlign.right,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/user.png',
                ),
                backgroundColor: Colors.white,
                radius: 25.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
