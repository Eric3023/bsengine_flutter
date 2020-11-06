import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///用户信息组件
class UserData extends StatelessWidget {
  final double totalAmount;
  final int likesNum;
  final int orderNum;

  const UserData({Key key, this.totalAmount, this.likesNum, this.orderNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: ScreenUtil.getInstance().setWidth(KDimen.mine_user_data_width),
      margin: EdgeInsets.only(
          top: ScreenUtil.getInstance()
              .setHeight(KDimen.mine_user_data_margin_top)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                '$likesNum',
                style: KFont.userDataStyle,
                maxLines: 1,
              ),
              Text(
                '我的喜欢',
                style: KFont.userDataStyle,
                maxLines: 1,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '$orderNum',
                style: KFont.userDataStyle,
                maxLines: 1,
              ),
              Text(
                '已经播报',
                style: KFont.userDataStyle,
                maxLines: 1,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                totalAmount.toStringAsFixed(2),
                style: KFont.userDataStyle,
                maxLines: 1,
              ),
              Text(
                '收益(元)',
                style: KFont.userDataStyle,
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
