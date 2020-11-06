import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityCategoryItem extends StatelessWidget {
  final Map map;

  const ActivityCategoryItem({Key key, this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance()
          .setWidth(KDimen.activity_category_item_icon_dimen),
      height: ScreenUtil.getInstance()
          .setWidth(KDimen.activity_category_item_icon_dimen),
      margin: EdgeInsets.all(ScreenUtil.getInstance()
          .setWidth(KDimen.activity_category_item_margin)),
      child: Image.asset(map['icon']),
    );
  }
}
