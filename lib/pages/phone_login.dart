import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/model/login.dart';
import 'package:bsengine_flutter/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

///登录页面
class PhoneLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhoneLoginPageState();
  }
}

class PhoneLoginPageState extends State<PhoneLoginPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var loginModel = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          KString.name,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(KDimen.appbar_title_size),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(
          ScreenUtil.getInstance().setWidth(KDimen.phone_login_layout_padding),
        ),
        children: [
          //手机号
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance()
                  .setWidth(KDimen.phone_login_password_top),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      bottom: ScreenUtil.getInstance()
                          .setWidth(KDimen.phone_login_param_phone_line_bottom),
                      right: ScreenUtil.getInstance()
                          .setWidth(KDimen.phone_login_param_phone_line_right),
                      child: Container(
                        color: KColor.buttonColor,
                        width: ScreenUtil.getInstance().setWidth(
                            KDimen.phone_login_param_phone_line_width),
                        height: ScreenUtil.getInstance().setWidth(
                            KDimen.phone_login_param_phone_line_height),
                      ),
                    ),
                    Text(
                      '手机号码',
                      style: KFont.loginParamTitleFont,
                    ),
                  ],
                ),
                // Text('下划线'),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance()
                        .setWidth(KDimen.phone_login_param_input_margin),
                  ),
                  child: TextField(
                    controller: _phoneController,
                    cursorColor: KColor.login_register_cursor,
                    cursorHeight: KDimen.phone_login_input_cursor_height,
                    style: KFont.loginInputFont,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '请输入手机号',
                      hintStyle: KFont.loginInputHitFont,
                      contentPadding: EdgeInsets.only(
                        top: ScreenUtil.getInstance()
                            .setWidth(KDimen.phone_login_param_input_padding),
                        bottom: ScreenUtil.getInstance()
                            .setWidth(KDimen.phone_login_param_input_padding),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        width: ScreenUtil.getInstance()
                            .setWidth(KDimen.border_width),
                        color: KColor.login_register_param_line,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        width: ScreenUtil.getInstance()
                            .setWidth(KDimen.border_width),
                        color: KColor.login_register_param_line,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //密码
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance()
                  .setWidth(KDimen.phone_login_password_top),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      bottom: ScreenUtil.getInstance().setWidth(
                          KDimen.phone_login_param_password_line_bottom),
                      right: ScreenUtil.getInstance().setWidth(
                          KDimen.phone_login_param_password_line_right),
                      child: Container(
                        color: KColor.buttonColor,
                        width: ScreenUtil.getInstance().setWidth(
                            KDimen.phone_login_param_password_line_width),
                        height: ScreenUtil.getInstance().setWidth(
                            KDimen.phone_login_param_password_line_height),
                      ),
                    ),
                    Text(
                      '密码',
                      style: KFont.loginParamTitleFont,
                    ),
                  ],
                ),
                // Text('下划线'),
                Container(
                  margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance()
                        .setWidth(KDimen.phone_login_param_input_margin),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    cursorColor: KColor.login_register_cursor,
                    cursorHeight: KDimen.phone_login_input_cursor_height,
                    style: KFont.loginInputFont,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[^\u4e00-\u9fa5]")),
                      LengthLimitingTextInputFormatter(16),
                    ],
                    //隐藏文本
                    obscureText: true,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '不含特殊字符的数字、字母组合',
                      hintStyle: KFont.loginInputHitFont,
                      contentPadding: EdgeInsets.only(
                        top: ScreenUtil.getInstance()
                            .setWidth(KDimen.phone_login_param_input_padding),
                        bottom: ScreenUtil.getInstance()
                            .setWidth(KDimen.phone_login_param_input_padding),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        width: ScreenUtil.getInstance()
                            .setWidth(KDimen.border_width),
                        color: KColor.login_register_param_line,
                      )),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        width: ScreenUtil.getInstance()
                            .setWidth(KDimen.border_width),
                        color: KColor.login_register_param_line,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //登录
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance()
                  .setWidth(KDimen.phone_login_button_top),
            ),
            child: InkWell(
              onTap: () {
                _onLogin();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: ScreenUtil.getInstance()
                    .setWidth(KDimen.phone_login_button_height),
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
                  '登录',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance()
                        .setWidth(KDimen.phone_login_button_font_size),
                  ),
                ),
              ),
            ),
          ),
          //注册
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance()
                  .setWidth(KDimen.phone_login_register_button_top),
            ),
            child: InkWell(
              onTap: () {
                _onRegister();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                height: ScreenUtil.getInstance()
                    .setWidth(KDimen.phone_login_button_height),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: KColor.login_register_button_background,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      ScreenUtil.getInstance()
                          .setWidth(KDimen.phone_login_button_radius),
                    ),
                  ),
                ),
                child: Text(
                  '注册',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance()
                        .setWidth(KDimen.phone_login_button_font_size),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //登录
  void _onLogin() {
    var phone = _phoneController.text;
    var password = _passwordController.text;

    var checkPhone = _checkPhoneNum(phone);
    if (!checkPhone) return;

    var checkPassword = _checkPassword(password);
    if (!checkPassword) return;

    loginModel.login(
        username: phone,
        password: password,
        success: (res) async {
          if (res != null) {
            ToastUtil.show('登录成功');
          }

          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setString('phone', res['userInfo']['phone']);
          sp.setString('token', res['token']);
        },
        failure: (exp) {
          ToastUtil.show('登录失败');
        });
  }

  //注册
  void _onRegister() {}

  //手机号校验
  bool _checkPhoneNum(String phone) {
    if (!loginModel.checkPhone(phone)) {
      ToastUtil.show('手机号格式不正确');
      return false;
    }
    return true;
  }

  //密码校验
  bool _checkPassword(String password) {
    if (!loginModel.checkPassword(password)) {
      ToastUtil.show('密码不能为空');
      return false;
    }
    return true;
  }
}
