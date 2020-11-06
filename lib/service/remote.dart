import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/utils/net.dart';

class RemoteService {
  ///获取首页轮播
  static void getHomeBanner({Function success, Function failure}) {
    Net().get(Api.banner, success: success, failure: failure);
  }

  ///获取推荐
  static void getHomeRecommend({Function success, Function failure}) {
    Net().get(Api.recommend, success: success, failure: failure);
  }

  /// 获取活动列表
  static void getActivities(Map<String, dynamic> params,
      {Function success, Function failure}) {
    Net().get(Api.activityList, params: params, success: success, failure: failure);
  }

  /// 获取媒体账号列表
  static void getAccounts(Map<String, dynamic> params,
      {Function success, Function failure}) {
    Net().get(Api.mediaList, params: params, success: success, failure: failure);
  }

  /// 登录
  static void login(Map<String, dynamic> params,
      {Function success, Function failure}) {
    Net().post(Api.login, params: params, success: success, failure: failure);
  }

  /// 获取用户信息
  static void getUserInfo({Function success, Function failure}) {
    Net().get(Api.userInfo, success: success, failure: failure);
  }
}
