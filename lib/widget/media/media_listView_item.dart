import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaListViewItem extends StatelessWidget {
  final Map data;

  const MediaListViewItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setWidth(KDimen.media_item_margin_top),
        bottom:
            ScreenUtil.getInstance().setWidth(KDimen.media_item_margin_bottom),
      ),
      padding: EdgeInsets.only(
        top: ScreenUtil.getInstance().setWidth(KDimen.media_item_padding_ver),
        bottom:
            ScreenUtil.getInstance().setWidth(KDimen.media_item_padding_ver),
        left: ScreenUtil.getInstance().setWidth(KDimen.media_item_padding_hor),
        right: ScreenUtil.getInstance().setWidth(KDimen.media_item_padding_hor),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(KDimen.media_item_radius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //头像
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil.getInstance()
                    .setWidth(KDimen.media_item_img_radius)),
                child: Image.network(
                  data['headImg'],
                  width: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_item_img_dimen),
                  height: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_item_img_dimen),
                ),
              ),
              //信息
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_item_info_margin),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          data['mediaIcon'],
                          width: ScreenUtil.getInstance()
                              .setWidth(KDimen.media_item_info_icon_dimen),
                          height: ScreenUtil.getInstance()
                              .setWidth(KDimen.media_item_info_icon_dimen),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: ScreenUtil.getInstance()
                                .setWidth(KDimen.media_item_info_name_margin),
                          ),
                          child: Text(
                            data['accountName'],
                            style: KFont.mediaInfoStyle,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance()
                            .setWidth(KDimen.media_item_info_id_margin_top),
                      ),
                      child: Text(
                        'ID：' + data['id'].toString(),
                        style: KFont.mediaInfoStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //审核状态
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_item_state_margin),
                ),
                child: Image.asset(
                  'assets/images/icon/icon_media.png',
                  width: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_item_state_icon_dimen),
                  height: ScreenUtil.getInstance()
                      .setWidth(KDimen.media_item_state_icon_dimen),
                ),
              ),
              Text(
                '审核成功',
                style: KFont.mediaStateStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
