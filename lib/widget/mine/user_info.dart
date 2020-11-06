import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///用户信息组件
class UserInfo extends StatelessWidget {
  final Map data;
  final Function(BuildContext) onClick;

  const UserInfo({Key key, this.data, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: ScreenUtil.getInstance().setWidth(KDimen.mine_user_info_width),
      margin: EdgeInsets.only(
          top: ScreenUtil.getInstance()
              .setWidth(KDimen.mine_user_info_margin_top)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              onClick(context);
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil.getInstance()
                        .setWidth(KDimen.mine_header_photo_margin),
                    right: ScreenUtil.getInstance()
                        .setWidth(KDimen.mine_header_photo_margin),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(ScreenUtil.getInstance()
                        .setWidth(KDimen.mine_header_photo_radius)),
                    child: Image.asset(
                      'assets/images/mine/icon_header.png',
                      fit: BoxFit.fill,
                      width: ScreenUtil.getInstance().setWidth(
                        KDimen.mine_header_photo_dimen,
                      ),
                      height: ScreenUtil.getInstance().setWidth(
                        KDimen.mine_header_photo_dimen,
                      ),
                    ),
                  ),
                ),
                Text(
                  '用户名称',
                  style: TextStyle(
                    color: KColor.mineNicknameColor,
                    fontSize: ScreenUtil.getInstance()
                        .setWidth(KDimen.mine_header_nickname_font_size),
                  ),
                ),
              ],
            ),
          ),
          //提取现金
          Container(
            width:
                ScreenUtil.getInstance().setWidth(KDimen.mine_withdraw_width),
            height:
                ScreenUtil.getInstance().setWidth(KDimen.mine_withdraw_height),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: KColor.mineWithdrawBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(KDimen.mine_withdraw_radius),
                bottomLeft: Radius.circular(KDimen.mine_withdraw_radius),
              ),
            ),
            child: Text(
              '提取现金',
              style: TextStyle(
                color: KColor.mineWithdrawTextColor,
                fontSize: ScreenUtil.getInstance()
                    .setSp(KDimen.mine_withdraw_font_size),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
