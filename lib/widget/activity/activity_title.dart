import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityTitle extends StatelessWidget {
  const ActivityTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance()
            .setWidth(KDimen.activity_subtitle_margin_top),
        bottom: ScreenUtil.getInstance()
            .setWidth(KDimen.activity_subtitle_margin_bottom),
        left: ScreenUtil.getInstance()
            .setWidth(KDimen.activity_subtitle_margin_hor),
        right: ScreenUtil.getInstance()
            .setWidth(KDimen.activity_subtitle_margin_hor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //活动列表
          Text(
            '活动列表',
            style: TextStyle(
              color: KColor.activitySubtitleColor,
              fontSize: ScreenUtil.getInstance()
                  .setSp(KDimen.activity_subtitle_font_size),
              fontWeight: FontWeight.w600,
            ),
          ),
          //火热排行榜
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: ScreenUtil.getInstance()
                  .setWidth(KDimen.activity_subtitle_rank_margin_hor),
              right: ScreenUtil.getInstance()
                  .setWidth(KDimen.activity_subtitle_rank_margin_hor),
            ),
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance()
                  .setWidth(KDimen.activity_subtitle_rank_padding_hor),
              right: ScreenUtil.getInstance()
                  .setWidth(KDimen.activity_subtitle_rank_padding_hor),
              top: ScreenUtil.getInstance()
                  .setWidth(KDimen.activity_subtitle_rank_padding_ver),
              bottom: ScreenUtil.getInstance()
                  .setWidth(KDimen.activity_subtitle_rank_padding_ver),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: KColor.activitySubtitleRankColor,
                width: ScreenUtil.getInstance().setWidth(KDimen.border_width),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(ScreenUtil.getInstance()
                    .setWidth(KDimen.activity_subtitle_rank_radius)),
              ),
            ),
            child: Text(
              '火热排行榜',
              style: TextStyle(
                color: KColor.activitySubtitleRankColor,
                fontSize: ScreenUtil.getInstance()
                    .setSp(KDimen.activity_subtitle_rank_font_size),
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
