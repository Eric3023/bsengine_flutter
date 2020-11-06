import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/widget/common/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //标题栏
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        title: Text(
          KString.password,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(KDimen.appbar_title_size),
          ),
        ),
      ),

      body: ListView(
        children: [
          //头部标志
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              left: ScreenUtil.getInstance()
                  .setWidth(KDimen.change_password_icon_left),
              right: ScreenUtil.getInstance()
                  .setWidth(KDimen.change_password_icon_left),
              top: ScreenUtil.getInstance()
                  .setWidth(KDimen.change_password_icon_top),
              bottom: ScreenUtil.getInstance()
                  .setWidth(KDimen.change_password_icon_bottom),
            ),
            child: Image.asset(
              'assets/images/icon/icon_password.jpg',
              width: ScreenUtil.getInstance()
                  .setWidth(KDimen.change_password_icon_width),
              height: ScreenUtil.getInstance()
                  .setHeight(KDimen.change_password_icon_height),
            ),
          ),
          //Form表单
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //新密码
              Container(
                width: ScreenUtil.getInstance()
                    .setWidth(KDimen.change_password_param_width),
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance()
                      .setWidth(KDimen.change_password_param_top),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: ScreenUtil.getInstance()
                          .setWidth(KDimen.change_password_title_width),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '新密码',
                        style: KFont.changePasswordTitleFont,
                      ),
                    ),
                    Container(
                      width: ScreenUtil.getInstance()
                          .setWidth(KDimen.change_password_input_width),
                      height: ScreenUtil.getInstance()
                          .setWidth(KDimen.change_password_input_height),
                      margin: EdgeInsets.only(
                        left: ScreenUtil.getInstance()
                            .setWidth(KDimen.change_password_input_margin),
                      ),
                      child: TextField(
                        cursorColor: KColor.login_register_cursor,
                        cursorHeight: KDimen.phone_login_input_cursor_height,
                        style: KFont.loginInputFont,
                        obscureText: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                        ],
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(
                            ScreenUtil.getInstance()
                                .setWidth(KDimen.change_password_input_padding),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: ScreenUtil.getInstance()
                                  .setWidth(KDimen.border_width),
                              color: KColor.login_register_param_line,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: ScreenUtil.getInstance()
                                  .setWidth(KDimen.border_width),
                              color: KColor.login_register_param_line,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //新密码提示
              Container(
                width: ScreenUtil.getInstance()
                    .setWidth(KDimen.change_password_input_width),
                height: ScreenUtil.getInstance()
                    .setWidth(KDimen.change_password_tip_height),
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance()
                      .setWidth(KDimen.change_password_tip_top),
                  left: ScreenUtil.getInstance()
                      .setWidth(KDimen.change_password_tip_left),
                ),
                child: Text(
                  '密码由6-12位（字母、数字、符号）组成，区分大小写',
                  style: KFont.changePasswordTipFont,
                ),
              ),
              //确认新密码
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance()
                      .setWidth(KDimen.change_password_param_top),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: ScreenUtil.getInstance()
                          .setWidth(KDimen.change_password_title_width),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '确认新密码',
                        style: KFont.changePasswordTitleFont,
                      ),
                    ),
                    Container(
                      width: ScreenUtil.getInstance()
                          .setWidth(KDimen.change_password_input_width),
                      height: ScreenUtil.getInstance()
                          .setWidth(KDimen.change_password_input_height),
                      margin: EdgeInsets.only(
                        left: ScreenUtil.getInstance()
                            .setWidth(KDimen.change_password_input_margin),
                      ),
                      child: TextField(
                        cursorColor: KColor.login_register_cursor,
                        cursorHeight: KDimen.phone_login_input_cursor_height,
                        style: KFont.loginInputFont,
                        obscureText: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                        ],
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(
                            ScreenUtil.getInstance()
                                .setWidth(KDimen.change_password_input_padding),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: ScreenUtil.getInstance()
                                  .setWidth(KDimen.border_width),
                              color: KColor.login_register_param_line,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: ScreenUtil.getInstance()
                                  .setWidth(KDimen.border_width),
                              color: KColor.login_register_param_line,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //验证码
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance()
                      .setWidth(KDimen.change_password_param_top),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: ScreenUtil.getInstance()
                          .setWidth(KDimen.change_password_title_width),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '验证码',
                        style: KFont.changePasswordTitleFont,
                      ),
                    ),
                    Container(
                      width: ScreenUtil.getInstance()
                          .setWidth(KDimen.change_password_input_width),
                      height: ScreenUtil.getInstance()
                          .setWidth(KDimen.change_password_input_height),
                      margin: EdgeInsets.only(
                        left: ScreenUtil.getInstance()
                            .setWidth(KDimen.change_password_input_margin),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: ScreenUtil.getInstance().setWidth(
                                KDimen.change_password_code_input_width),
                            height: ScreenUtil.getInstance()
                                .setWidth(KDimen.change_password_input_height),
                            child: TextField(
                              cursorColor: KColor.login_register_cursor,
                              cursorHeight:
                                  KDimen.phone_login_input_cursor_height,
                              style: KFont.loginInputFont,
                              obscureText: true,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(12),
                              ],
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(
                                  ScreenUtil.getInstance().setWidth(
                                      KDimen.change_password_input_padding),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: ScreenUtil.getInstance()
                                        .setWidth(KDimen.border_width),
                                    color: KColor.login_register_param_line,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: ScreenUtil.getInstance()
                                        .setWidth(KDimen.border_width),
                                    color: KColor.login_register_param_line,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: ScreenUtil.getInstance()
                                .setWidth(KDimen.change_password_code_width),
                            height: ScreenUtil.getInstance()
                                .setWidth(KDimen.change_password_code_height),
                            decoration: BoxDecoration(
                              color: KColor.buttonColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  ScreenUtil.getInstance().setWidth(
                                      KDimen.change_password_title_size),
                                ),
                              ),
                            ),
                            child: Text(
                              '获取',
                              style: KFont.changePasswordCodeFont,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //验证码提示
              Container(
                width: ScreenUtil.getInstance()
                    .setWidth(KDimen.change_password_input_width),
                height: ScreenUtil.getInstance()
                    .setWidth(KDimen.change_password_tip_height),
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance()
                      .setWidth(KDimen.change_password_tip_top),
                  left: ScreenUtil.getInstance()
                      .setWidth(KDimen.change_password_tip_left),
                ),
                child: Text(
                  '已向手机号*******发送验证码送验证码',
                  style: KFont.changePasswordTipFont,
                ),
              ),
              //确认按钮
              Container(
                margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance()
                      .setWidth(KDimen.change_password_btn_top),
                ),
                child: ESButton(
                  title: '确认',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// font-size: 28
// color: white;
// border-radius: 28
