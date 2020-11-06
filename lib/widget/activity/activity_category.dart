import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/widget/activity/activity_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityCategory extends StatelessWidget {
  final List list;
  final Function(int) onTap;

  const ActivityCategory({Key key, this.list, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil.getInstance()
          .setWidth(KDimen.activity_category_layout_dimen),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/background/activity.jpg'),
        ),
      ),
      alignment: Alignment.bottomLeft,
      child: Container(
        height: ScreenUtil.getInstance()
            .setWidth(KDimen.activity_category_item_height),
        margin: EdgeInsets.all(
          ScreenUtil.getInstance()
              .setWidth(KDimen.activity_category_item_margin),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list != null ? list.length : 0,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                onTap(index);
              },
              child: ActivityCategoryItem(
                map: list[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
