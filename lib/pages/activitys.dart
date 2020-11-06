import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/model/activity.dart';
import 'package:bsengine_flutter/utils/log.dart';
import 'package:bsengine_flutter/utils/scroll.dart';
import 'package:bsengine_flutter/widget/activity/activity_category.dart';
import 'package:bsengine_flutter/widget/activity/activity_grid.dart';
import 'package:bsengine_flutter/widget/activity/activity_list.dart';
import 'package:bsengine_flutter/widget/common/loading.dart';
import 'package:bsengine_flutter/widget/common/order_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///待接单列表
class ActivitiesPage extends StatefulWidget {
  @override
  _ActivityPagePageState createState() {
    return _ActivityPagePageState();
  }
}

class _ActivityPagePageState extends State<ActivitiesPage> with AutomaticKeepAliveClientMixin{

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
                //标题
                OrderTitle(title: '待接单列表',),
                //列表
                ActivityGridView(list: _list,),
              ],
            ),
          ),
          if (_isLock()) Loading(),
        ],
      ),
    );
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

  @override
  bool get wantKeepAlive => true;
}
