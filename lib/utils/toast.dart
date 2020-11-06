import 'package:bsengine_flutter/config/color.dart';
import 'package:bsengine_flutter/config/dimen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static show(msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: KColor.toastBackgroundColor,
      textColor: KColor.toastColor,
      fontSize: ScreenUtil.getInstance().setWidth(KDimen.toast_font_size),
    );
  }
}
