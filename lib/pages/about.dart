import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //标题栏
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        title: Text(
          KString.about,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(KDimen.appbar_title_size),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          //顶部图片
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance().setWidth(KDimen.about_img_top),
            ),
            child: Image.asset(
              'assets/images/background/login.png',
              width: ScreenUtil.getInstance().setWidth(KDimen.about_img_width),
              height:
                  ScreenUtil.getInstance().setWidth(KDimen.about_img_height),
              fit: BoxFit.fill,
            ),
          ),
          //法律声明和隐私政策
          Container(
            width: ScreenUtil.getInstance().setWidth(KDimen.width),
            margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setHeight(KDimen.height * 0.64 -
                    KDimen.about_img_height -
                    KDimen.about_img_top)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '《法律声明及隐私政策》',
                  style: TextStyle(
                    color: KColor.about_text_color,
                    fontSize:
                        ScreenUtil.getInstance().setSp(KDimen.about_text_size),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance()
                        .setWidth(KDimen.about_text_top),
                  ),
                  child: Text(
                    '播商引擎',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance()
                          .setSp(KDimen.about_text_size),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
