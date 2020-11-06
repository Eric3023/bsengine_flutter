import 'package:bsengine_flutter/base/application.dart';
import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/widget/home/search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_banner.dart';
import 'home_navigation.dart';

///首页顶部布局
class HeaderContainer extends StatelessWidget {
  final List banners;

  const HeaderContainer({Key key, this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil.getInstance()
          .setWidth(KDimen.home_header_container_height),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          //顶部轮播
          HomeBanner(
            list: banners,
          ),
          //搜索按钮
          Positioned(
            top: ScreenUtil.getInstance()
                .setWidth(KDimen.home_search_layout_top),
            child: InkWell(
              onTap: (){
                Application.router.navigateTo(context, '/search');
              },
              child: SearchContainer(),
            ),
          ),
          //中部导航
          Positioned(
            bottom: ScreenUtil.getInstance()
                .setWidth(KDimen.navigator_layout_margin_bottom),
            child: HomeNavigator(),
          ),
        ],
      ),
    );
  }
}