const base = 'http://192.168.1.10:9000/';

class Api {
  //轮播banner
  static const String banner = base + 'wx/index/banner';

  //首页宣传
  static const String recommend = base + 'wx/index/static';

  //手机号登录
  static const String login = base + '/wx/auth/login';

  //用户信息
  static const userInfo = base + '/wx/user/index';

  //活动列表
  static const activityList = base + '/api/activity/getLiveActivitys';

  //获取账号列表
  static const mediaList = base + '/api/mediaAccount/getListByUserId';

}
