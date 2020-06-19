import 'package:centers/src/student/providers/studentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:centers/src/student/ui/studentProfileScreen.dart';

class StudentAppBar extends StatefulWidget {
  @override
  _StudentAppBarState createState() => _StudentAppBarState();
}

class _StudentAppBarState extends State<StudentAppBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<StudentProvider>(context, listen: false)
            .barAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<StudentProvider>(context, listen: false)
        .barAnimationController
        .dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
      builder: (context, screen, _) => Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 5.0,
          right: 10.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              tooltip: screen.isList ? 'main' : 'categories',
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: screen.barAnimationController,
                color: screen.isList ? Colors.indigo[900] : Colors.white,
                size: 30.0,
              ),
              onPressed: () => screen.handleListChanges(),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StudentProfileScreen()));
              },
              child: Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
