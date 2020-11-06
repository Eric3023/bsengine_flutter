import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///搜索顶部组件
class SearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final Function() onClear;

  const SearchBar({Key key, this.onSearch, this.onClear}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchBarState(onSearch, onClear);
  }
}

class SearchBarState extends State<SearchBar> {
  final Function(String) onSearch;
  final Function() onClear;

  SearchBarState(this.onSearch, this.onClear);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff6f6f6),
      child: Container(
        width: ScreenUtil.getInstance()
            .setWidth(KDimen.search_header_container_width),
        height: ScreenUtil.getInstance()
            .setWidth(KDimen.search_header_container_height),
        margin: EdgeInsets.only(
          top: ScreenUtil.getInstance()
              .setWidth(KDimen.search_header_container_margin_ver),
          bottom: ScreenUtil.getInstance()
              .setWidth(KDimen.search_header_container_margin_ver),
          left: ScreenUtil.getInstance()
              .setWidth(KDimen.search_header_container_margin_hor),
          right: ScreenUtil.getInstance()
              .setWidth(KDimen.search_header_container_margin_hor),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              ScreenUtil.getInstance()
                  .setWidth(KDimen.search_header_container_radius),
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xffe0e0e0),
              blurRadius: ScreenUtil.getInstance()
                  .setWidth(KDimen.navigator_layout_shadow),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //搜索Icon
                Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil.getInstance()
                        .setWidth(KDimen.search_header_icon_margin),
                    right: ScreenUtil.getInstance()
                        .setWidth(KDimen.search_header_icon_margin),
                  ),
                  child: Image.asset(
                    'assets/images/icon/icon_search2.png',
                    width: ScreenUtil.getInstance()
                        .setWidth(KDimen.search_header_icon_dimen),
                    height: ScreenUtil.getInstance()
                        .setWidth(KDimen.search_header_icon_dimen),
                  ),
                ),
                //搜索输入框
                Container(
                  width: ScreenUtil.getInstance()
                      .setWidth(KDimen.search_header_input_width),
                  height: ScreenUtil.getInstance()
                      .setWidth(KDimen.search_header_input_height),
                  child: TextField(
                    cursorColor: KColor.login_register_cursor,
                    cursorHeight: KDimen.phone_login_input_cursor_height,
                    style: KFont.searchInputFont,
                    decoration: InputDecoration(
                      hintText: '输入搜索内容',
                      isDense: true,
                      contentPadding: EdgeInsets.all(
                        ScreenUtil.getInstance()
                            .setWidth(KDimen.change_password_input_padding),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: ScreenUtil.getInstance()
                              .setWidth(KDimen.border_width),
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: ScreenUtil.getInstance()
                              .setWidth(KDimen.border_width),
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    onSubmitted: (val){
                      onSearch(val);
                    },
                    textInputAction: TextInputAction.search,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ScreenUtil.getInstance()
                      .setWidth(KDimen.search_line_width),
                  height: ScreenUtil.getInstance()
                      .setWidth(KDimen.search_line_height),
                  margin: EdgeInsets.only(
                    left: ScreenUtil.getInstance()
                        .setWidth(KDimen.search_line_margin),
                    right: ScreenUtil.getInstance()
                        .setWidth(KDimen.search_line_margin),
                  ),
                  color: KColor.search_header_line_color,
                ),
                InkWell(
                  onTap: () {
                    onClear();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: ScreenUtil.getInstance()
                          .setWidth(KDimen.search_header_right),
                    ),
                    child: Text(
                      '取消',
                      style: KFont.searchInputFont,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
