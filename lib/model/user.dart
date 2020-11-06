import 'package:bsengine_flutter/service/remote.dart';

class UserModel {
  /// 手机号登录
  void getUserInfo({Function success, Function failure}) {
    RemoteService.getUserInfo(success: success, failure: failure);
  }
}
