import 'package:bsengine_flutter/service/remote.dart';

class MediaModel {
  //获取待接单列表
  void getAccounts({
    int isLive = 0,
    int page = 1,
    int size = 10,
    Function success,
    Function failure,
  }) {
    var params = {
      'isLive': isLive,
      'page': page,
      'size': size,
    };
    RemoteService.getAccounts(params, success: success, failure: failure);
  }
}
