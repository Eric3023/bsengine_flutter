import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ActivityDetailPageState();
  }
}

class ActivityDetailPageState extends State<ActivityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      //标题栏
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.white,
        title: Text(
          KString.activity_detail,
          style: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(KDimen.appbar_title_size),
          ),
        ),
      ),
    );
  }
}
