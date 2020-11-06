import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTitle extends StatelessWidget {

  final String title;

  const OrderTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance()
            .setWidth(KDimen.order_title_top),
        bottom: ScreenUtil.getInstance()
            .setWidth(KDimen.order_title_top),
        left: ScreenUtil.getInstance()
            .setWidth(KDimen.order_title_left),
        right: ScreenUtil.getInstance()
            .setWidth(KDimen.order_title_left),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //活动列表
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil.getInstance()
                  .setSp(KDimen.order_title_font_size),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
