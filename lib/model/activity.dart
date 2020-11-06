import 'package:bsengine_flutter/service/remote.dart';

class ActivityModel {
  //获取待接单列表
  void getActivities({
    name,
    int status = 3,
    int page = 1,
    int size = 10,
    Function success,
    Function failure,
  }) {
    var params = {
      'name': name,
      'status': status,
      'page': page,
      'size': size,
    };
    RemoteService.getActivities(params, success: success, failure: failure);
  }
}
