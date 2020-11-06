import 'package:bsengine_flutter/widget/activity/activity_grid.dart';
import 'package:bsengine_flutter/widget/common/order_title.dart';
import 'package:bsengine_flutter/widget/search/search_bar.dart';
import 'package:bsengine_flutter/widget/search/search_history.dart';
import 'package:flutter/material.dart';

///搜索顶部组件
class SearchResult extends StatefulWidget {
  final Function onClear;
  final Function(String) onSearch;
  final Function onClearHistory;
  final List list;

  const SearchResult(
      {Key key, this.onClear, this.onSearch, this.list, this.onClearHistory})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchResultState(onClear, onSearch, list, onClearHistory);
  }
}

class SearchResultState extends State<SearchResult> {
  final Function onClear;
  final Function(String) onSearch;
  final Function onClearHistory;

  final List list;

  SearchResultState(
      this.onClear, this.onSearch, this.list, this.onClearHistory);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      children: [
        //标题
        OrderTitle(title: '待接单列表',),
        //列表
        ActivityGridView(list: list,),
      ],
    );
  }
}
