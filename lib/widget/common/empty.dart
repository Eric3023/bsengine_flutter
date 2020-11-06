import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Empty extends StatelessWidget {
  final String msg;
  final double top;

  const Empty({Key key, this.msg, this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setWidth(top),
      ),
      child: Text(
        msg,
        style: KFont.emptyFont,
      ),
    );
  }
}
