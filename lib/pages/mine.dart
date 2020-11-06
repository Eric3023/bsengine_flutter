import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/model/user.dart';
import 'package:bsengine_flutter/pages/phone_login.dart';
import 'package:bsengine_flutter/base/application.dart';
import 'package:bsengine_flutter/widget/common/setting_item.dart';
import 'package:bsengine_flutter/widget/common/dialog.dart';
import 'package:bsengine_flutter/widget/mine/user_Info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  var list = [
    {'icon': 'assets/images/mine/icon_bank.png', 'title': "银行卡"},
    {'icon': 'assets/images/mine/icon_mine_rmb.jpg', 'title': "提现记录"},
    {'icon': 'assets/images/mine/icon_mine_quan.jpg', 'title': "订单规则"},
    {'icon': 'assets/images/mine/icon_mine_proxy.jpg', 'title': "意见反馈"},
    {'icon': 'assets/images/mine/icon_mine_setting.png', 'title': "设置"}
  ];

  var userModel = UserModel();

  var totalAmount = 0.00;
  var likesNum = 0;
  var orderNum = 0;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          //个人信息
          UserInfoContainer(
            totalAmount: totalAmount,
            likesNum: likesNum,
            orderNum: orderNum,
            onClick: _jumpToLogin,
          ),
          //功能列表
          Container(
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
          //尾部提示
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0,
                  ScreenUtil.getInstance()
                      .setWidth(KDimen.tail_container_margin_top),
                  0,
                  ScreenUtil.getInstance()
                      .setWidth(KDimen.tail_container_margin_bottom)),
              child: Text(
                '没有更多了',
                style: KFont.infoStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///跳转到登录页面
  _jumpToLogin(context) {
    Application.router.navigateTo(context, "/login");
  }

  ///跳转到其他页面
  _jumpToPage(BuildContext context, int index) {
    switch (index) {
      case 4:
        Application.router.navigateTo(context, "/setting");
        break;
    }
  }

  /// 获取用户信息
  void _getUserInfo() {
    userModel.getUserInfo(success: (res) {
      if (res != null) {
        this.setState(() {
          likesNum = res['likesNum'] != null ? res['likesNum'] : 0;
          orderNum = res['orderNum'] != null ? res['orderNum'] : 0;
          totalAmount = res['totalAmount'] != null ? res['totalAmount'] : 0;
        });
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
