import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {
  final Map data;
  final bool isLast;

  const SettingItem({Key key, this.data, this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //主体
        Container(
          height: ScreenUtil.getInstance()
              .setWidth(KDimen.mine_setting_item_height),
          margin: EdgeInsets.only(
            left: ScreenUtil.getInstance()
                .setWidth(KDimen.mine_setting_icon_margin),
            right: ScreenUtil.getInstance()
                .setWidth(KDimen.mine_setting_icon_margin),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //icon图标
                  Container(
                    child: Image.asset(
                      data['icon'],
                      width: ScreenUtil.getInstance()
                          .setWidth(KDimen.mine_setting_icon_dimen),
                      height: ScreenUtil.getInstance()
                          .setWidth(KDimen.mine_setting_icon_dimen),
                    ),
                    margin: EdgeInsets.only(
                      right: ScreenUtil.getInstance()
                          .setWidth(KDimen.mine_setting_icon_margin),
                    ),
                  ),
                  //文本
                  Text(
                    data['title'],
                    style: KFont.settingItemStyle,
                  ),
                ],
              ),
              //进入符号
              //icon图标
              Container(
                child: Image.asset(
                  'assets/images/mine/icon_mine_enter.png',
                  width: ScreenUtil.getInstance()
                      .setWidth(KDimen.mine_setting_enter_margin),
                  height: ScreenUtil.getInstance()
                      .setWidth(KDimen.mine_setting_enter_margin),
                ),
                margin: EdgeInsets.only(
                  left: ScreenUtil.getInstance()
                      .setWidth(KDimen.mine_setting_icon_margin),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: ScreenUtil.getInstance().setWidth(KDimen.border_width),
                color: isLast ? Colors.transparent : KColor.defaultBorderColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
