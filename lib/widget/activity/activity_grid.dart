import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/widget/activity/activity_grid_item.dart';
import 'package:bsengine_flutter/widget/common/empty.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ActivityGridView extends StatelessWidget {
  final List list;

  const ActivityGridView({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list == null || list.length == 0) {
      return Empty(msg: '数据为空~~~', top: 180,);
    } else {
      return Container(
        margin: EdgeInsets.only(
          left: ScreenUtil.getInstance()
              .setWidth(KDimen.activity_list_layout_margin_hor),
          right: ScreenUtil.getInstance()
              .setWidth(KDimen.activity_list_layout_margin_hor),
        ),
        padding: EdgeInsets.all(0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: ScreenUtil.getInstance()
              .setWidth(KDimen.activity_list_item_margin),
          crossAxisSpacing: ScreenUtil.getInstance()
              .setWidth(KDimen.activity_list_item_margin),
          itemCount: list != null ? list.length : 0,
          itemBuilder: (context, i) {
            return ActivityGridViewItem(
              map: list[i],
            );
          },
          staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
        ),
      );
    }
  }
}
