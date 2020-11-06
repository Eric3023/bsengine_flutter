import 'package:bsengine_flutter/config/color.dart';
import 'package:bsengine_flutter/config/dimen.dart';
import 'package:bsengine_flutter/config/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaCategory extends StatefulWidget {

  final Function(int) onClick;

  const MediaCategory({Key key, this.onClick}) : super(key: key);

  @override
  State<MediaCategory> createState() {
    return _MediaCategoryState(onClick);
  }
}

class _MediaCategoryState extends State<MediaCategory> {
  var index = 0;
  final Function(int) onClick;

  _MediaCategoryState(this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
          top: ScreenUtil.getInstance().setWidth(KDimen.media_category_margin),
          bottom:
              ScreenUtil.getInstance().setWidth(KDimen.media_category_margin),
          left: 0,
          right: 0),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(KDimen.media_category_width),
        //边框
        decoration: BoxDecoration(
          border: Border.all(
            width: KDimen.border_width,
            color: KColor.buttonColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(KDimen.media_category_radius),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  index = 0;
                });
                onClick(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index == 0 ? KColor.buttonColor : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(KDimen.media_category_radius),
                  ),
                ),
                width: ScreenUtil.getInstance()
                    .setWidth(KDimen.media_category_video_width),
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_category_padding),
                  bottom: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_category_padding),
                ),
                child: Text(
                  '视频/直播',
                  style: index == 0
                      ? KFont.mediaCategoryActiveStyle
                      : KFont.mediaCategoryDisActiveStyle,
                ),
              ),
            ),
            //视频直播
            InkWell(
              onTap: () {
                setState(() {
                  index = 1;
                });
                onClick(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index != 0 ? KColor.buttonColor : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(KDimen.media_category_radius),
                  ),
                ),
                width: ScreenUtil.getInstance()
                    .setWidth(KDimen.media_category_other_width),
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_category_padding),
                  bottom: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_category_padding),
                ),
                child: Text(
                  '其他',
                  style: index != 0
                      ? KFont.mediaCategoryActiveStyle
                      : KFont.mediaCategoryDisActiveStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
