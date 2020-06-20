import 'package:flutter/material.dart';

class ProfileAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight = 200;
  final String title;
  final Widget icon;
  ProfileAppBar({
    this.title = 'Null',
    this.icon
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    MediaQueryData screen = MediaQuery.of(context);
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          height: 90.0,
          width: screen.size.width,
          decoration: shrinkOffset / expandedHeight >= 0.85
              ? BoxDecoration(color: Colors.white)
              : BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo[900],
                Colors.indigo[400],
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: shrinkOffset / expandedHeight >= 0.85
                      ? Colors.indigo
                      : Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: shrinkOffset / expandedHeight >= 0.90
                      ? Colors.indigo
                      : Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 26.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
                image:AssetImage('assets/images/maleAvatar.png'),
            )
          ),
        ),
        Positioned(
          top: expandedHeight - 65.0 - shrinkOffset,
          left: 0.0,
          right: 0.0,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Container(
              height: 120,
              width: 120,
              child: CircleAvatar(
                child: Image.asset('assets/images/maleAvatar.png',height: 90,width: 90,),
                backgroundColor: Colors.white
              ),
            )
          ),
        ),
        Row(
            children: <Widget>[
              icon,
            ],
          ),

      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
