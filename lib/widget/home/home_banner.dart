import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///首页轮播
class HomeBanner extends StatelessWidget {
  final List list;

  const HomeBanner({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(KDimen.banner_width),
      height: ScreenUtil().setWidth(KDimen.banner_height),
      child: Swiper(
        loop: true,
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () {},
            child: Image.network(
              "${list[index]['imageUrl']}",
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: list.length,
        // pagination: SwiperPagination(),
        autoplay: list != null && list.length > 0,
      ),
    );
  }
}
