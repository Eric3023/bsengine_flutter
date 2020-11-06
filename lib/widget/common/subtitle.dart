import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///子标题组件
class SubTitle extends StatelessWidget {
  final String title;

  const SubTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance()
            .setWidth(KDimen.sub_title_layout_padding_top),
        bottom: ScreenUtil.getInstance()
            .setWidth(KDimen.sub_title_layout_padding_bottom),
        left: ScreenUtil.getInstance()
            .setWidth(KDimen.sub_title_layout_padding_left),
        right: ScreenUtil.getInstance()
            .setWidth(KDimen.sub_title_layout_padding_right),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: KFont.subTitleStyle,
      ),
    );
  }
}
