import 'package:bsengine_flutter/service/remote.dart';

class LoginModel {
  /// 校验手机号是否合法
  bool checkPhone(String value) {
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

    value = value.trim();
    //手机号为空
    if (value.isEmpty) {
      return false;
    }
    //手机号不合法
    else if (value.trim().length != 11 || !exp.hasMatch(value)) {
      return false;
    }
    //手机号合法
    else {
      return true;
    }
  }

  /// 校验密码
  bool checkPassword(String value) {
    value = value.trim();
    //密码为空
    if (value.isEmpty) {
      return false;
    }
    //密码合法
    else {
      return true;
    }
  }

  /// 手机号登录
  void login({type = 0, username, password, success, failure}) {
    RemoteService.login({
      'type': type.toString(),
      'username': username.toString(),
      'password': password.toString(),
    }, success: success, failure: failure);
  }
}
