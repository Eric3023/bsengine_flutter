import 'dart:io';

import 'package:bsengine_flutter/pages/index.dart';
import 'package:bsengine_flutter/provide/category_index_provide.dart';
import 'package:bsengine_flutter/base/application.dart';
import 'package:bsengine_flutter/routers/routers.dart';
import 'package:bsengine_flutter/utils/log.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';
import './config/index.dart';
import './provide/current_index_provide.dart';

void main() {
  var providers = _initProvider();
  _initLog();
  _initImmersive();
  _initRouters();

  runApp(ProviderNode(
    child: MyApp(),
    providers: providers,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KString.name, //播商引擎
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: KColor.primaryColor,
      ),
      //修改状态栏字体颜色
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: IndexPage(),
      ),
    );
  }
}

///初始化共享Provide
Providers _initProvider() {
  var currentIndexProvide = CurrentIndexProvide();
  var categoryProvide = CategoryProvide();

  var providers = Providers(); //提供者
  providers
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
    ..provide(Provider<CategoryProvide>.value(categoryProvide));

  return providers;
}

///初始化日志打印工具
void _initLog() {
  LogUtil.init(isDebug: true, title: "ESEngine", limitLength: 800);
}

///沉浸式开发
void _initImmersive() {
  // 判断当前设备是否为安卓
  if (Platform.isAndroid) {
    // 设置状态栏颜色为透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

///初始化路由
void _initRouters() {
  FluroRouter  router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
}
