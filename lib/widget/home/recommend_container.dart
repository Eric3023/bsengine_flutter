import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/widget/common/subtitle.dart';
import 'package:bsengine_flutter/widget/home/recommend_list.dart';
import 'package:flutter/material.dart';

/// 商品推荐组件
class RecommendContainer extends StatelessWidget {
  final List list;

  const RecommendContainer({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: KDimen.container_margin_top),
      child: Column(
        children: [
          //推荐标题
          SubTitle(
            title: KString.recommend,
          ),
          //推荐列表
          RecommendList(list: list,),
        ],
      ),
    );
  }
}
