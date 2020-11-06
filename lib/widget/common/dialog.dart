import 'package:bsengine_flutter/base/application.dart';
import 'package:bsengine_flutter/config/dimen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDialog {
  ///提示登录
  void show(context, {title = '提示', content, confirm}) {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance()
                    .setSp(KDimen.dialog_title_font_size),
              ),
            ),
          ),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text(
                  content,
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance()
                        .setSp(KDimen.dialog_content_font_size),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                '取消',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('确定'),
              onPressed: confirm,
            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }
}
