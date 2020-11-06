import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/widget/activity/activity_grid.dart';
import 'package:bsengine_flutter/widget/activity/activity_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityList extends StatelessWidget {
  final List list;

  const ActivityList({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        //标题
        ActivityTitle(),
        //列表
        ActivityGridView(list: list,),
      ],
    );
  }
}
