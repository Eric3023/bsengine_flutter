import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 分类导航组件
class HomeNavigator extends StatelessWidget {
  const HomeNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(KDimen.navigator_layout_width),
      height: ScreenUtil().setWidth(KDimen.navigator_layout_height),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background/home_options.jpg',
          ),
          fit: BoxFit.fill,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            ScreenUtil.getInstance().setWidth(KDimen.navigator_layout_radius),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: KColor.defaultShadowColor,
            blurRadius: ScreenUtil.getInstance()
                .setWidth(KDimen.navigator_layout_shadow),
          ),
        ],
      ),
      child: GridView.count(
        crossAxisCount: 4,
        physics: NeverScrollableScrollPhysics(),
        children: [],
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item, index) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(90),
          ),
          Text(item['firstCategoryName']),
        ],
      ),
    );
  }
}
