import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/widget/mine/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user_data.dart';

class UserInfoContainer extends StatelessWidget {
  final Function(BuildContext) onClick;
  final double totalAmount;
  final int likesNum;
  final int orderNum;

  const UserInfoContainer({Key key, this.onClick,this.totalAmount, this.likesNum, this.orderNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance()
          .setWidth(KDimen.mine_user_info_container_height),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background/mine.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          //用户信息
          UserInfo(
            onClick: onClick,
          ),
          //用户数据
          UserData(
            totalAmount: totalAmount,
            likesNum: likesNum,
            orderNum: orderNum,
          ),
        ],
      ),
    );
  }
}
