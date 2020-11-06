import 'package:bsengine_flutter/base/application.dart';
import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/model/activity.dart';
import 'package:bsengine_flutter/utils/log.dart';
import 'package:bsengine_flutter/utils/scroll.dart';
import 'package:bsengine_flutter/widget/activity/activity_category.dart';
import 'package:bsengine_flutter/widget/activity/activity_list.dart';
import 'package:bsengine_flutter/widget/common/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPagePageState createState() {
    return _ActivityPagePageState();
  }
}

class _ActivityPagePageState extends State<ActivityPage>
    with AutomaticKeepAliveClientMixin {
  //订单状态
  var types = [
    {'id': 0x1001, 'icon': 'assets/images/activity/icon_wait_receive.png'},
    {'id': 0x1002, 'icon': 'assets/images/activity/icon_wait_action.png'},
    {'id': 0x1003, 'icon': 'assets/images/activity/icon_wait_exam.png'},
    {'id': 0x1004, 'icon': 'assets/images/activity/icon_wait_tested.png'},
    {'id': 0x1005, 'icon': 'assets/images/activity/icon_completed.png'},
    {'id': 0x1006, 'icon': 'assets/images/activity/icon_refused.png'},
    {'id': 0x1007, 'icon': 'assets/images/activity/icon_stopped.png'},
    {'id': 0x1001, 'icon': 'assets/images/activity/icon_cancel.png'},
  ];

  //活动列表
  var _list = [];
  var _page = 1;
  var _hasMore = true;
  var _lock = false;

  var activityModel = ActivityModel();

  @override
  void initState() {
    super.initState();
    _getActivities();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      //标题栏
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        title: Text(
          KString.activity,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(KDimen.appbar_title_size),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          NotificationListener(
            onNotification: (ScrollNotification note) {
              onScrollNotification(note, reachBottom: _getActivities);
              return false;
            },
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                //活动、订单分类
                ActivityCategory(
                  list: types,
                  onTap: onChangeType,
                ),
                //活动列表
                ActivityList(
                  list: _list,
                ),
              ],
            ),
          ),
          if (_isLock()) Loading(),
        ],
      ),
    );
  }

  ///点击上方类型
  void onChangeType(index) {
    switch (index) {
      case 0:
        Application.router.navigateTo(context, '/activities');
        break;
    }
  }

  /// 获取活动列表
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

  @override
  bool get wantKeepAlive => true;
}
