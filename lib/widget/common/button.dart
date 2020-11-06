import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ESButton extends StatelessWidget {
  final Function onClick;
  final String title;

  const ESButton({Key key, this.onClick, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: ScreenUtil.getInstance().setWidth(KDimen.button_width),
        height: ScreenUtil.getInstance().setWidth(KDimen.button_height),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: KColor.buttonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenUtil.getInstance()
                  .setWidth(KDimen.phone_login_button_radius),
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil.getInstance()
                .setWidth(KDimen.phone_login_button_font_size),
          ),
        ),
      ),
    );
  }
}
