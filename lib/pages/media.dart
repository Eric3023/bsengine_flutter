import 'package:bsengine_flutter/config/index.dart';
import 'package:bsengine_flutter/model/media.dart';
import 'package:bsengine_flutter/utils/scroll.dart';
import 'package:bsengine_flutter/widget/common/loading.dart';
import 'package:bsengine_flutter/widget/media/media_category.dart';
import 'package:bsengine_flutter/widget/media/media_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() {
    return _MediaPageState();
  }
}

class _MediaPageState extends State<MediaPage> with AutomaticKeepAliveClientMixin{
  List _data = [];
  var _page = 1;
  var _hasMore = true;
  var _lock = false;
  var _type = 0;

  var mediaModel = MediaModel();

  @override
  void initState() {
    super.initState();
    _getAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //标题栏
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        title: Text(
          KString.media,
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
              onScrollNotification(note, reachBottom: _getAccounts);
              return false;
            },
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                //顶部分类
                MediaCategory(
                  onClick: _changeType,
                ),
                //媒体列表
                MediaListView(
                  list: _data,
                  loading: _isLock(),
                ),
              ],
            ),
          ),
          if (_isLock()) Loading(),
        ],
      ),
      //添加媒体
      floatingActionButton: Container(
        width: ScreenUtil.getInstance().setWidth(KDimen.media_add_dimen),
        height: ScreenUtil.getInstance().setWidth(KDimen.media_add_dimen),
        margin: EdgeInsets.only(
          bottom:
              ScreenUtil.getInstance().setWidth(KDimen.media_add_margin_bottom),
          right:
              ScreenUtil.getInstance().setWidth(KDimen.media_add_margin_right),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: KColor.buttonColor,
        ),
      ),
    );
  }

  ///获取账号列表
  void _getAccounts() {
    if (_isLock() || !_hasMore) return;
    _addLock();
    mediaModel.getAccounts(
      isLive: _type,
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
            _data.addAll(res['list']);
          });
        }
      },
      failure: (exp) {
        _removeLock();
      },
    );
  }

  ///获取账号列表
  void _changeType(type) {
    _reset(type);
    _getAccounts();
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

  /// 重置数据
  _reset(type) {
    _type = type;
    _data.clear();
    _page = 1;
    _lock = false;
    _hasMore = true;
  }

  @override
  bool get wantKeepAlive => true;
}
