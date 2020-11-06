import 'package:flutter/material.dart';

class CategoryProvide with ChangeNotifier {
  //一级分类索引
  int firstCategoryIndex = 0;

  //二级分类索引
  int secondCategoryIndex = 0;

  //分类页码
  int page = 0;

  //更改一级分类
  changeFirstCategoryIndex(int index) {
    firstCategoryIndex = index;
    secondCategoryIndex = 0;
    resetPage();
    notifyListeners();
  }

  //更改二级分类
  changeSecondCategoryIndex(int index) {
    secondCategoryIndex = index;
    resetPage();
    notifyListeners();
  }

  //页码增加
  increasePage() {
    page++;
  }

  //页码重置
  resetPage() {
    page = 1;
  }
}
