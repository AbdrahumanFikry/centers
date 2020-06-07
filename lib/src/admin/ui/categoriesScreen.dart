import 'package:centers/src/admin/component/CategroiesHolder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:centers/src/models/centerDataModel.dart';

class Categories extends StatelessWidget {
  final List<CenterDataModel> data = [
    CenterDataModel(
      title: 'Labs',
      count: 10,
    ),
    CenterDataModel(
      title: 'Teachers',
      count: 14,
    ),
    CenterDataModel(
      title: 'Students',
      count: 127,
    ),
    CenterDataModel(
      title: 'Workers',
      count: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 105,
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: CategoryHolder(
                    title: data[index].title,
                    count: data[index].count,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
