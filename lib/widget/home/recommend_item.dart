import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///推荐Item组件
class RecommendItem extends StatelessWidget {
  final Map data;

  const RecommendItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(KDimen.recommend_item_width),
        height: ScreenUtil().setWidth(KDimen.recommend_item_height),
        margin: EdgeInsets.only(
            top: ScreenUtil.getInstance()
                .setWidth(KDimen.recommend_item_margin_ver),
            bottom: ScreenUtil.getInstance()
                .setWidth(KDimen.recommend_item_margin_ver)),
        child: Column(
          children: [
            //防止溢出
            Expanded(
              child: Image.network(
                data['imageUrl'],
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
