import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/model/activity.dart';
import 'package:bsengine_flutter/utils/scroll.dart';
import 'package:bsengine_flutter/utils/toast.dart';
import 'package:bsengine_flutter/widget/activity/activity_grid.dart';
import 'package:bsengine_flutter/widget/common/loading.dart';
import 'package:bsengine_flutter/widget/common/order_title.dart';
import 'package:bsengine_flutter/widget/search/result.dart';
import 'package:bsengine_flutter/widget/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  List<String> history = [];

  //活动列表
  var _list = [];
  var _page = 1;
  var _hasMore = true;
  var _lock = false;

  var activityModel = ActivityModel();

  @override
  void initState() {
    super.initState();
    _getHistory();
    _getActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //标题栏
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        title: Text(
          KString.search,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(KDimen.appbar_title_size),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          //搜索组件
          SearchView(
            onSearch: onSearch,
            onClear: onClear,
            list: history,
            onClearHistory: _clearHistory,
          ),
          //搜索结果
          NotificationListener(
            onNotification: (ScrollNotification note) {
              onScrollNotification(note, reachBottom: _getActivities);
              return false;
            },
            child: SearchResult(
              list: _list,
            ),
          ),
          if (_isLock()) Loading(),
        ],
      ),
    );
  }

  ///确认搜索
  void onSearch(String key) {
    if (key == null || key.isEmpty) {
      ToastUtil.show('搜索内容不能为空');
      return;
    }

    _addHistory(key);
  }

  ///取消搜索
  void onClear() {
    print('====================');
    print('取消搜索');
  }

  ///获取搜索历史
  void _getHistory() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> sHistory = sp.getStringList('history');
    if (sHistory == null || sHistory.length == 0) {
      sHistory = [];
    }
    this.setState(() {
      history.clear();
      history.addAll(sHistory);
    });
  }

  ///添加搜索历史
  void _addHistory(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> sHistory = sp.getStringList('history');
    //不存在本地记录
    if (sHistory == null || sHistory.length == 0) {
      sHistory = [];
      sHistory.insert(0, key);
      if (sHistory.length > 10) {
        sHistory = sHistory.sublist(0, 10);
      }
      sp.setStringList('history', sHistory);
      this.setState(() {
        history.clear();
        history.addAll(sHistory);
      });
    }
    //已经存在本地记录
    else {
      sHistory.remove(key);
      sHistory.insert(0, key);
      if (sHistory.length > 10) {
        sHistory = sHistory.sublist(0, 10);
      }
      sp.setStringList('history', sHistory);
      this.setState(() {
        history.clear();
        history.addAll(sHistory);
      });
    }
  }

  ///清空搜索历史
  void _clearHistory() async {
    List<String> sHistory = [];
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('history', sHistory);
    this.setState(() {
      history.clear();
      history.addAll(sHistory);
    });
  }

  ///获取活动列表
  void _getActivities() {
    if (_isLock() || !_hasMore) return;
    _addLock();
    activityModel.getActivities(
      page: _page,
      success: (res) {
        _removeLock();
        if (res != null && res['list'] != null) {
          var hasNext = res['pageData']['hasNext'] != null
              ? res['pageData']['hasNext']
              : false;
          this.setState(() {
            _hasMore = hasNext;
            _page++;
            _list.addAll(res['list']);
          });
        }
      },
      failure: (exp) {
        _removeLock();
      },
    );
  }

  /// 是否加锁（正在请求数据）
  bool _isLock() {
    return _lock;
  }

  /// 加锁
  void _addLock() {
    this.setState(() {
      _lock = true;
    });
  }

  /// 解锁
  void _removeLock() {
    this.setState(() {
      _lock = false;
    });
  }
}
