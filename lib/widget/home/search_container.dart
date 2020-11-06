import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///首页搜搜入口组件
class SearchContainer extends StatelessWidget {
  final Map data;

  const SearchContainer({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(KDimen.home_search_layout_width),
      height:
          ScreenUtil.getInstance().setWidth(KDimen.home_search_layout_height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            ScreenUtil.getInstance().setWidth(KDimen.home_search_layout_radius),
          ),
        ),
        color: KColor.homeSearchLayoutBackgroundColor,
      ),
      child: Row(
        children: [
          //左侧菜单按钮
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil.getInstance()
                    .setWidth(KDimen.home_search_icon_margin),
                right: ScreenUtil.getInstance()
                    .setWidth(KDimen.home_search_icon_margin)),
            child: Image.asset(
              'assets/images/icon/icon_list.png',
              width: ScreenUtil.getInstance()
                  .setWidth(KDimen.home_search_icon_width),
              height: ScreenUtil.getInstance()
                  .setWidth(KDimen.home_search_icon_height),
            ),
          ),
          //右侧搜索按钮
          Container(
            margin: EdgeInsets.only(
                left: ScreenUtil.getInstance()
                    .setWidth(KDimen.home_search_icon_margin),
                right: ScreenUtil.getInstance()
                    .setWidth(KDimen.home_search_icon_margin)),
            child: Image.asset(
              'assets/images/icon/icon_search.png',
              width: ScreenUtil.getInstance()
                  .setWidth(KDimen.home_search_icon_width),
              height: ScreenUtil.getInstance()
                  .setWidth(KDimen.home_search_icon_height),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
