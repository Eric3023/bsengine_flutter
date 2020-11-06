import 'package:bsengine_flutter/base/application.dart';
import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/model/home.dart';
import 'package:bsengine_flutter/service/remote.dart';
import 'package:bsengine_flutter/widget/home/header_ container.dart';
import 'package:bsengine_flutter/widget/home/recommend_container.dart';
import 'package:flutter/material.dart';

///首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

/// AutomaticKeepAliveClientMixin,保存widget状态
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  //数据源模块
  var homeModel = HomeModel();

  //轮播数据源
  var banners = [];

  //首页推荐
  var recommends = [];

  /// 保存widget当前状态
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getBanner();
    _getRecommend();
  }

  ///视图架构
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // // 隐藏状态栏和底部按钮栏
    // SystemChrome.setEnabledSystemUIOverlays ([]);
    // // 隐藏底部按钮栏
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
    // 隐藏状态栏
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    var bannerData = [];
    bannerData.addAll(banners);

    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          //顶部轮播
          HeaderContainer(
            banners: bannerData,
          ),
          //平台推荐
          RecommendContainer(
            list: recommends,
          ),
        ],
      ),
    );
  }

  ///获取首页轮播图片
  void _getBanner() {
    homeModel.getHomeBanner(success: (res) {
      if (res != null && res.length > 0) {
        this.setState(() {
          banners.clear();
          banners.addAll(res);
        });
      }
    });
  }

  ///获取首页推荐
  void _getRecommend() {
    RemoteService.getHomeRecommend(success: (res) {
      if (res != null && res.length > 0) {
        this.setState(() {
          recommends = res;
        });
      }
    });
  }
}
