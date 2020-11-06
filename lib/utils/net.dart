import 'dart:convert';
import 'package:bsengine_flutter/base/application.dart';
import 'package:bsengine_flutter/base/model.dart';
import 'package:bsengine_flutter/widget/common/dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 自定义枚举
enum Method { get, post }

class Net {
  // 工厂模式
  factory Net() => _getInstance();

  static Net get instance => _getInstance();
  static Net _instance;

  Dio dio;

  Net._internal() {
    // 初始化
    dio = Dio(BaseOptions(
      connectTimeout: 60000, // 连接服务器超时时间，单位是毫秒.
      receiveTimeout: 10000, // 响应流上前后两次接受到数据的间隔，单位为毫秒, 这并不是接收数据的总时限.
    ));
  }

  // 单列模式
  static Net _getInstance() {
    if (_instance == null) {
      _instance = Net._internal();
    }
    return _instance;
  }

  get(String url,
      {Map<String, dynamic> params, Function success, Function failure}) {
    _doRequest(url, params, Method.get, success, failure);
  }

  post(String url,
      {Map<String, dynamic> params, Function success, Function failure}) {
    _doRequest(url, params, Method.post, success, failure);
  }

  void _doRequest(String url, Map<String, dynamic> params, Method method,
      Function successCallBack, Function failureCallBack) async {
    try {
      /// 可以添加header
      SharedPreferences sp = await SharedPreferences.getInstance();
      String token = sp.getString('token');
      dio.options.headers.addAll({
        'Content': 'application/json',
        'token': token,
      });
      Response response;
      switch (method) {
        case Method.get:
          if (params != null && params.isNotEmpty) {
            response = await dio.get(url, queryParameters: params);
          } else {
            response = await dio.get(url);
          }
          break;
        case Method.post:
          if (params != null && params.isNotEmpty) {
            // response = await dio.post(url, queryParameters: params);
            response = await dio.post(url, data: params);
          } else {
            response = await dio.post(url);
          }
          break;
      }
      Map<String, dynamic> result = json.decode(response.toString());
      // 打印信息
      // print('''api: $url\nparams: $params\nresult: $result''');
      // 转化为model
      BaseModel model = BaseModel.fromJson(result);
      if (model.code == 0) {
        // 200 请求成功
        if (successCallBack != null) {
          //返回请求数据
          successCallBack(model.data);
        }
      }
      //未登录或登录过期
      else if (model.code == 800) {
        ShowDialog().show(
          Application.currentContext,
          content: '用户未登录或登录已过期，请重新登录',
          confirm: () {
            Navigator.of(Application.currentContext).pop();
            Application.router.navigateTo(Application.currentContext, "/login");
          },
        );
        if (failureCallBack != null) {
          failureCallBack(model.error);
        }
      } else {
        //TODO
        //直接使用Toast弹出错误信息
        //返回失败信息
        if (failureCallBack != null) {
          failureCallBack(model.error);
        }
      }
    } catch (exception) {
      print('错误：${exception.toString()}');
      if (failureCallBack != null) {
        failureCallBack(exception.toString());
      }
    }
  }
}
