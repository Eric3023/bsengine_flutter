import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator_view/loading_indicator_view.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(KDimen.width),
      height: ScreenUtil.getInstance().setWidth(KDimen.height),
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil.getInstance().setWidth(KDimen.loading_width),
        height: ScreenUtil.getInstance().setWidth(KDimen.loading_height),
        decoration: BoxDecoration(
          color: Color(0x50000000),
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenUtil.getInstance().setWidth(KDimen.loading_radius),
            ),
          ),
        ),
        child: BallSpinFadeLoaderIndicator(
          ballColor: Colors.white,
        ),
      ),
    );
  }
}
