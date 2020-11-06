import 'package:bsengine_flutter/widget/search/search_bar.dart';
import 'package:bsengine_flutter/widget/search/search_history.dart';
import 'package:flutter/material.dart';

///搜索顶部组件
class SearchView extends StatefulWidget {
  final Function onClear;
  final Function(String) onSearch;
  final Function onClearHistory;
  final List list;

  const SearchView(
      {Key key, this.onClear, this.onSearch, this.list, this.onClearHistory})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchViewState(onClear, onSearch, list, onClearHistory);
  }
}

class SearchViewState extends State<SearchView> {
  final Function onClear;
  final Function(String) onSearch;
  final Function onClearHistory;

  final List list;

  SearchViewState(this.onClear, this.onSearch, this.list, this.onClearHistory);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //搜索栏
          SearchBar(
            onClear: onClear,
            onSearch: onSearch,
          ),
          //历史搜索
          if (list != null && list.length > 0)
            SearchHistory(
              list: list,
              onSearch: onSearch,
              onClearHistory: onClearHistory,
            ),
        ],
      ),
    );
  }
}
