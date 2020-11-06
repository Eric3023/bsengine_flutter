import 'package:bsengine_flutter/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///搜索顶部组件
class SearchHistory extends StatefulWidget {
  final List list;
  final Function(String) onSearch;
  final Function() onClearHistory;

  const SearchHistory({Key key, this.list, this.onSearch, this.onClearHistory})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchHistoryState(list, onSearch, onClearHistory);
  }
}

class SearchHistoryState extends State<SearchHistory> {
  final List list;
  final Function() onClearHistory;
  final Function(String) onSearch;

  SearchHistoryState(this.list, this.onSearch, this.onClearHistory);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          //历史搜素
          Container(
            width: ScreenUtil.getInstance().setWidth(KDimen.width),
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().setWidth(20),
              bottom: ScreenUtil.getInstance().setWidth(0),
              left: ScreenUtil.getInstance().setWidth(35),
              right: ScreenUtil.getInstance().setWidth(35),
            ),
            child: Column(
              children: [
                //标题
                Container(
                  height: ScreenUtil.getInstance().setWidth(90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          '历史搜索',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: ScreenUtil.getInstance().setSp(32),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setWidth(20),
                          bottom: ScreenUtil.getInstance().setWidth(20),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          print("===========");
                          print("清空历史");

                          onClearHistory();
                        },
                        child: Image.asset(
                          'assets/images/icon/icon_clear.png',
                          width: ScreenUtil.getInstance().setWidth(32),
                          height: ScreenUtil.getInstance().setWidth(32),
                        ),
                      ),
                    ],
                  ),
                ),
                //列表
                Container(
                  width: double.infinity,
                  child: Wrap(
                    spacing: ScreenUtil.getInstance().setWidth(18),
                    runSpacing: ScreenUtil.getInstance().setWidth(12),
                    children: list.map((e) {
                      return Container(
                        padding: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setWidth(12),
                          bottom: ScreenUtil.getInstance().setWidth(12),
                          left: ScreenUtil.getInstance().setWidth(18),
                          right: ScreenUtil.getInstance().setWidth(18),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfff0f0f0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              ScreenUtil.getInstance().setWidth(28),
                            ),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            onSearch(e);
                          },
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setWidth(26),
                              color: Color(0xff484848),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
