import 'package:bsengine_flutter/provide/current_index_provide.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

///自定义底部导航栏
class DBottomNavigationBar extends StatefulWidget {
  final List<Widget> tabs;
  final double height;

  const DBottomNavigationBar({Key key, this.tabs, this.height}) : super(key: key);

  @override
  State<DBottomNavigationBar> createState() {
    return _DBottomNavigationBarState(tabs, height);
  }
}

class _DBottomNavigationBarState extends State<DBottomNavigationBar> {
  final List<Widget> tabs;
  final double height;

  _DBottomNavigationBarState(this.tabs, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SizedBox(
          height: height,
          child: Card(
            elevation: 0.0,
            shape: RoundedRectangleBorder(),
            margin: EdgeInsets.all(0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: tabs,
            ),
          ),
        ),
      ),
    );
  }
}

class DBottomNavigationBarItem extends StatefulWidget {
  final String label;
  final String imagePath;
  final String activeImagePath;
  final int index;
  final Color color;
  final Color activeColor;
  final Function(BuildContext, int) onTap;
  final double iconDimen;

  const DBottomNavigationBarItem(
      {Key key,
      this.label,
      this.imagePath,
      this.activeImagePath,
      this.index,
      this.color,
      this.activeColor,
      this.onTap,
      this.iconDimen})
      : super(key: key);

  @override
  State<DBottomNavigationBarItem> createState() {
    return _DBottomNavigationBarItemState(label, imagePath, activeImagePath,
        index, color, activeColor, onTap, iconDimen);
  }
}

class _DBottomNavigationBarItemState extends State<DBottomNavigationBarItem> {
  final String title;
  final String imagePath;
  final String activeImagePath;
  final int index;
  final Color color;
  final Color activeColor;
  final Function(BuildContext, int) onTap;
  final double iconDimen;

  _DBottomNavigationBarItemState(
      this.title,
      this.imagePath,
      this.activeImagePath,
      this.index,
      this.color,
      this.activeColor,
      this.onTap,
      this.iconDimen);

  @override
  Widget build(BuildContext context) {
    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        Color _colors = index == val.currentIndex ? activeColor : color;
        String _imagePath =
            index == val.currentIndex ? activeImagePath : imagePath;

        return Expanded(
          child: InkResponse(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ImageIcon(
                //   icon,
                //   color: _colors,
                // ),
                Image.asset(
                  _imagePath,
                  width: iconDimen,
                  height: iconDimen,
                ),
                Text(
                  title,
                  style: TextStyle(color: _colors, fontSize: 12.0),
                )
              ],
            ),
            onTap: () {
              onTap(context, index);
            },
          ),
        );
      },
    );
  }
}
