import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TabLogic extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  RxList<String> tabs = RxList();
  int tabActiveIndex = 0;
  RxMap<int, List<dynamic>> resultsMap = RxMap();
  Map<int, int> tabPageNumberMap = {};
  Map<int, EasyRefreshController> tabControllers = {};

  late Function(int index, int pageNumber, Function(List<dynamic>))
      dataHandle; // 声明 dataHandle

  void setDataHandle(
      Function(int index, int pageNumber, Function(List<dynamic>)) handle) {
    dataHandle = handle; // 设置 dataHandle
  }

  int getPageByTabIndex() {
    return this.tabPageNumberMap[this.tabActiveIndex]!;
  }

  Future<void> getMoreData() async {
    dataHandle(
        tabActiveIndex,
        getPageByTabIndex(),
        (List<dynamic> result) => {
              _dataHandle(result),
              getEasyRefreshController().finishLoad(),
              getEasyRefreshController().resetHeader()
            });
  }

  getResults() => resultsMap[tabActiveIndex];

  void _dataHandle(List<dynamic> result) {
    var results = getResults();
    results = [...results, ...result];
    resultsMap[tabActiveIndex] = results;
    if (result.length > 0) addOnePageNumber();
  }

  updatePageNumber(index) {
    this.tabPageNumberMap[this.tabActiveIndex] = index;
  }

  addOnePageNumber() {
    this.tabPageNumberMap[this.tabActiveIndex] =
        this.tabPageNumberMap[this.tabActiveIndex]! + 1;
  }

  Future<void> getRefresh() async {
    resultsMap[tabActiveIndex] = [];
    dataHandle(
        tabActiveIndex,
        getPageByTabIndex(),
        (List<dynamic> result) => {
              _dataHandle(result),
              getEasyRefreshController().finishRefresh(),
              getEasyRefreshController().resetFooter(),
              getEasyRefreshController().resetHeader()
            });
  }

  List<dynamic> getResultData({int? index}) {
    var _index = index == null ? tabActiveIndex : index;
    return resultsMap.containsKey(_index) ? resultsMap[_index]! : [];
  }

  EasyRefreshController getEasyRefreshController({int? index = -1}) {
    index = index == -1 ? this.tabActiveIndex : index;
    return tabControllers[index]!;
  }

  tabChange(index) {
    if (tabController.index == tabController.animation!.value) {
      tabActiveIndex = index;
      var list = getResultData();
      if (list.length == 0) {
        getEasyRefreshController().callRefresh();
      }
    }
  }

  void initData() {
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.animateTo(0,
        duration: Duration(microseconds: 200), curve: Curves.linear);
    tabController.addListener(() => tabChange(tabController.index));

    for (int i = 0; i < tabs.length; i++) {
      EasyRefreshController refreshController = EasyRefreshController(
        controlFinishRefresh: true,
        controlFinishLoad: true,
      );
      tabPageNumberMap[i] = 1;
      tabControllers[i] = refreshController;
    }
  }
}
