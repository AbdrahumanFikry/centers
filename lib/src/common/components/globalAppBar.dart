import 'package:flutter/material.dart';

class GlobalAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight = 130;
  final Widget component;
  final String title;

  GlobalAppBar({
    this.component,
    this.title = 'Null',
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
        Positioned(
          top: expandedHeight - 40.0 - shrinkOffset,
          left: 0.0,
          right: 0.0,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
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
                child: component,
              ),
            ),
          ),
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
