import 'package:bsengine_flutter/base/application.dart';
import 'package:bsengine_flutter/config/dimen.dart';
import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/pages/activity.dart';
import 'package:bsengine_flutter/pages/home.dart';
import 'package:bsengine_flutter/pages/mine.dart';
import 'package:bsengine_flutter/pages/media.dart';
import 'package:bsengine_flutter/provide/current_index_provide.dart';
import 'package:bsengine_flutter/widget/common/bottom_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _initScreen(context);

    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        //当前选中Tab页面
        int currentIndex =
            Provide.value<CurrentIndexProvide>(context).currentIndex;
        Application.currentContext = context;
        return Scaffold(
          backgroundColor: KColor.backgroundColor,
          bottomNavigationBar: DBottomNavigationBar(
            tabs: initBottomTabs(currentIndex),
            height: ScreenUtil.getInstance().setWidth(KDimen.bottom_tab_height),
          ),
          // body: IndexedStack(
          //   index: currentIndex,
          //   children: initTabBodies(),
          // ),
          body: initTabBodies()[currentIndex],
        );
      },
    );
  }

  ///修改选中Tab
  _changeCurrentIndex(context, index) {
    Provide.value<CurrentIndexProvide>(context).changeIndex(index);
  }

  ///初始化屏幕适配
  void _initScreen(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: KDimen.width, height: KDimen.height)
      ..init(context);
  }

  ///底部导航Tab
  initBottomTabs(currentIndex) {
    List<Widget> bottomTabs = [
      DBottomNavigationBarItem(
        imagePath: 'assets/images/tabs/home_normal.png',
        activeImagePath: 'assets/images/tabs/home_selected.png',
        label: KString.home,
        index: 0,
        color: KColor.tabColorNormal,
        activeColor: KColor.tabColorSelected,
        onTap: _changeCurrentIndex,
        iconDimen: ScreenUtil.getInstance().setWidth(KDimen.bottom_tab_icon),
      ),
      DBottomNavigationBarItem(
        imagePath: 'assets/images/tabs/activity_normal.png',
        activeImagePath: 'assets/images/tabs/activity_selected.png',
        label: KString.activity,
        index: 1,
        color: KColor.tabColorNormal,
        activeColor: KColor.tabColorSelected,
        onTap: _changeCurrentIndex,
        iconDimen: ScreenUtil.getInstance().setWidth(KDimen.bottom_tab_icon),
      ),
      DBottomNavigationBarItem(
        imagePath: 'assets/images/tabs/media_normal.png',
        activeImagePath: 'assets/images/tabs/media_selected.png',
        label: KString.media,
        index: 2,
        color: KColor.tabColorNormal,
        activeColor: KColor.tabColorSelected,
        onTap: _changeCurrentIndex,
        iconDimen: ScreenUtil.getInstance().setWidth(KDimen.bottom_tab_icon),
      ),
      DBottomNavigationBarItem(
        imagePath: 'assets/images/tabs/mine_normal.png',
        activeImagePath: 'assets/images/tabs/mine_selected.png',
        label: KString.mine,
        index: 3,
        color: KColor.tabColorNormal,
        activeColor: KColor.tabColorSelected,
        onTap: _changeCurrentIndex,
        iconDimen: ScreenUtil.getInstance().setWidth(KDimen.bottom_tab_icon),
      ),
    ];
    return bottomTabs;
  }

  ///Tab主体
  initTabBodies() {
    //导航主体
    List<Widget> tabBodies = [
      HomePage(),
      ActivityPage(),
      MediaPage(),
      MinePage(),
    ];
    return tabBodies;
  }
}
