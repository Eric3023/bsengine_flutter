import 'package:bsengine_flutter/routers/handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = '/';
  static String loginPage = '/login';
  static String settingPage = '/setting';
  static String aboutPage = '/about';
  static String passwordPage = '/password';
  static String activitiesPage = '/activities';
  static String activityDetailPage = '/activityDetail';
  static String searchPage = '/search';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('error::: router 没有找到');
      return;
    });

    //登录
    router.define(loginPage, handler: loginHandler);
    router.define(settingPage, handler: settingHandler);
    router.define(passwordPage, handler: passwordHandler);
    router.define(aboutPage, handler: aboutHandler);
    router.define(activitiesPage, handler: activitiesHandler);
    router.define(searchPage, handler: searchHandler);
  }
}
