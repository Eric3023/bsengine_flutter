import 'package:bsengine_flutter/widget/common/empty.dart';
import 'package:flutter/material.dart';

import 'media_listView_item.dart';

class MediaListView extends StatelessWidget {
  final List list;
  final bool loading;

  const MediaListView({Key key, this.list, this.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((list == null || list.length == 0)&&!loading) {
      return Empty(
        msg: '数据为空~~~',
        top: 420,
      );
    }
    return ListView.builder(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list != null ? list.length : 0,
      itemBuilder: (context, index) {
        return MediaListViewItem(
          data: list[index],
        );
      },
    );
  }
}
