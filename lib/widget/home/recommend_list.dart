import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'recommend_item.dart';

class RecommendList extends StatelessWidget {
  final List list;

  const RecommendList({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: new NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return RecommendItem(data: list[index]);
      },
      itemCount: list.length,
    );
  }
}
