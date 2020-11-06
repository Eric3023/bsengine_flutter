import 'package:bsengine_flutter/base/application.dart';
import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/widget/common/dialog.dart';
import 'package:bsengine_flutter/widget/common/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

var list = [
  {'icon': 'assets/images/mine/icon_password.png', 'title': "修改密码"},
  {'icon': 'assets/images/mine/icon_mine_collection.jpg', 'title': "关于我们"},
  {'icon': 'assets/images/mine/icon_mine_setting.png', 'title': "退出登录"},
];

//设置页面
class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Application.currentContext = context;
    return Scaffold(
      //标题栏
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        title: Text(
          KString.setting,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(KDimen.appbar_title_size),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: KColor.defaultShadowColor,
              blurRadius: ScreenUtil.getInstance()
                  .setWidth(KDimen.navigator_layout_shadow),
            )
          ],
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                _jumpToPage(context, index);
              },
              child: SettingItem(
                data: list[index],
                isLast: index == list.length - 1,
              ),
            );
          },
        ),
      ),
    );
  }

  ///跳转到其他页面
  void _jumpToPage(BuildContext context, int index) {
    switch (index) {
      //修改密码
      case 0:
        Application.router.navigateTo(Application.currentContext, "/password");
        break;
      //关于我们
      case 1:
        Application.router.navigateTo(Application.currentContext, "/about");
        break;
      //退出登录
      case 2:
        ShowDialog().show(
          Application.currentContext,
          content: '确认需要退出登录？',
          confirm: () async {
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.remove('token');
            sp.remove('phone');
            Navigator.of(Application.currentContext).pop();
          },
        );
        break;
    }
  }
}
