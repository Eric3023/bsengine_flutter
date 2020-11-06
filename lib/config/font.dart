import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KFont {
  static TextStyle subTitleStyle = TextStyle(
    color: KColor.subTitleColor,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.sub_title_font_size),
    fontWeight: FontWeight.w500,
  );

  static TextStyle emptyFont = TextStyle(
    color: Colors.black54,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.empty_font_size),
  );

  static TextStyle infoStyle = TextStyle(
    color: KColor.subTitleColor,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.tail_container_font_size),
  );

  static TextStyle settingItemStyle = TextStyle(
    color: KColor.mineSettingTextColor,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.mine_setting_font_size),
  );

  static TextStyle userDataStyle = TextStyle(
    color: KColor.mineUserDataColor,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.mine_user_data_font_size),
  );

  static TextStyle mediaCategoryActiveStyle = TextStyle(
    color: Colors.white,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.media_category_font_size),
  );

  static TextStyle mediaCategoryDisActiveStyle = TextStyle(
    color: KColor.buttonColor,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.media_category_font_size),
  );

  static TextStyle mediaStateStyle = TextStyle(
    color: KColor.mediaStateTextColor,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.media_item_state_font_size),
  );

  static TextStyle mediaInfoStyle = TextStyle(
    color: Colors.black,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.media_item_info_font_size),
  );

  static TextStyle activityItemProgressFont = TextStyle(
    color: KColor.activityListItemProgressColor,
    fontSize: ScreenUtil.getInstance()
        .setSp(KDimen.activity_list_item_progress_font_size),
  );

  static TextStyle loginParamTitleFont = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize:
        ScreenUtil.getInstance().setSp(KDimen.phone_login_param_title_size),
  );

  static TextStyle loginInputFont = TextStyle(
    color: Colors.black,
    fontSize:
        ScreenUtil.getInstance().setSp(KDimen.phone_login_param_input_size),
  );

  static TextStyle loginInputHitFont = TextStyle(
    color: Colors.grey[500],
    fontSize:
        ScreenUtil.getInstance().setSp(KDimen.phone_login_param_input_size),
  );

  static TextStyle changePasswordTitleFont = TextStyle(
    color: Colors.black,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.change_password_title_size),
  );

  static TextStyle changePasswordTipFont = TextStyle(
    color: KColor.change_password_tip_text_color,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.change_password_tip_size),
  );

  static TextStyle changePasswordCodeFont = TextStyle(
    color: Colors.white,
    fontSize: ScreenUtil.getInstance().setSp(KDimen.change_password_title_size),
  );

  static TextStyle searchInputFont = TextStyle(
    color: KColor.search_header_input_color,
    fontSize:
    ScreenUtil.getInstance().setSp(KDimen.search_header_input_text_size),
  );

}
