import 'package:bsengine_flutter/service/remote.dart';

class HomeModel {
  ///获取首页轮播
  void getHomeBanner({Function success, Function failure}) {
    RemoteService.getHomeBanner(success: success, failure: failure);
  }

  ///获取推荐
  void getHomeRecommend({Function success, Function failure}) {
    RemoteService.getHomeRecommend(success: success, failure: failure);
  }
}
