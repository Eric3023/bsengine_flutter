import 'package:bsengine_flutter/config/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityGridViewItem extends StatelessWidget {
  final Map map;

  const ActivityGridViewItem({Key key, this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: KColor.defaultShadowColor,
            blurRadius: ScreenUtil.getInstance()
                .setWidth(KDimen.navigator_layout_shadow),
          ),
        ],
        borderRadius: new BorderRadius.all(
          Radius.circular(
            ScreenUtil.getInstance().setWidth(KDimen.activity_list_item_radius),
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: new BorderRadius.all(
          Radius.circular(
            ScreenUtil.getInstance().setWidth(KDimen.activity_list_item_radius),
          ),
        ),
        child: new InkWell(
          onTap: () {},
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  //活动图片
                  CachedNetworkImage(
                    imageUrl: map != null ? map['picUrl'] : '',
                    fit: BoxFit.fitWidth,
                    // placeholder: (context, url) =>
                    //     Image.asset('assets/images/background/activity.jpg'),
                  ),
                  //进度
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: KColor.maskColor,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //剩余单数
                          Container(
                            margin: EdgeInsets.only(
                                top: KDimen.activity_list_item_price_margin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //进度条
                                Container(
                                  width: ScreenUtil.getInstance().setWidth(
                                      KDimen.activity_list_item_progress_width),
                                  height: ScreenUtil.getInstance().setWidth(
                                      KDimen
                                          .activity_list_item_progress_height),
                                  margin: EdgeInsets.only(
                                    right: ScreenUtil.getInstance().setWidth(
                                        KDimen
                                            .activity_list_item_progress_margin),
                                  ),
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.grey[200],
                                    valueColor: AlwaysStoppedAnimation(KColor
                                        .activityListItemProgressColor),
                                    value: map['orderNumUse'] / map['orderNum'],
                                  ),
                                ),
                                Text(
                                    '剩' +
                                        (map['orderNum'] - map['orderNumUse'])
                                            .toString() +
                                        '单',
                                    style: KFont.activityItemProgressFont)
                              ],
                            ),
                          ),
                          //起止时间
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(map['startTime'],
                                    style: KFont.activityItemProgressFont),
                                Text('-',
                                    style: KFont.activityItemProgressFont),
                                Text(
                                  map['endTime'],
                                  style: KFont.activityItemProgressFont,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil.getInstance()
                      .setWidth(KDimen.activity_list_item_goods_margin),
                  right: ScreenUtil.getInstance()
                      .setWidth(KDimen.activity_list_item_goods_margin),
                  bottom: ScreenUtil.getInstance()
                      .setWidth(KDimen.activity_list_item_goods_margin),
                ),
                child: Column(
                  children: [
                    //标题
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance()
                            .setWidth(KDimen.activity_list_item_name_margin),
                      ),
                      child: Text(
                        map['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: KColor.activityListItemNameColor,
                          fontSize: ScreenUtil.getInstance()
                              .setSp(KDimen.activity_list_item_name_size),
                        ),
                      ),
                    ),
                    //播报类型
                    Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil.getInstance()
                            .setWidth(KDimen.activity_list_item_name_margin),
                        bottom: ScreenUtil.getInstance()
                            .setWidth(KDimen.activity_list_item_name_margin),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: ScreenUtil.getInstance()
                                .setWidth(KDimen.activity_list_item_name_width),
                            child: Text(
                              map['broadcastName'] +
                                  map['broadcastTimes'].toString() +
                                  '次',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: KColor.activityListItemNameColor,
                                fontSize: ScreenUtil.getInstance()
                                    .setSp(KDimen.activity_list_item_name_size),
                              ),
                            ),
                          ),
                          //价格
                          Container(
                            width: ScreenUtil.getInstance().setWidth(
                                KDimen.activity_list_item_price_width),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              left: ScreenUtil.getInstance().setWidth(
                                  KDimen.activity_list_item_price_padding),
                              right: ScreenUtil.getInstance().setWidth(
                                  KDimen.activity_list_item_price_padding),
                            ),
                            margin: EdgeInsets.only(
                              right: ScreenUtil.getInstance().setWidth(
                                  KDimen.activity_list_item_goods_margin),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: KDimen.border_width,
                                color: KColor.activityListItemPriceColor,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    KDimen.activity_list_item_price_size),
                              ),
                            ),
                            child: Text(
                              map['unitPrice'].toString() + '元',
                              style: TextStyle(
                                color: KColor.activityListItemPriceColor,
                                fontSize: ScreenUtil.getInstance().setWidth(
                                    KDimen.activity_list_item_price_size),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
