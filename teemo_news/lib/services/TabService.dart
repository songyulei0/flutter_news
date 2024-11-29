

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

mixin  TabService<T> on  SingleGetTickerProviderMixin {

  Map<String,String> tabLabelMap = {};
  Map<String,List<ScrollController>> scrollControllers = {};
  Map<int,EasyRefreshController> tabControllers = {};
  Rx<int> tabActiveIndex = 0.obs;
  Map<int,int> tabPageNumberMap = {};

  RxMap<int,dynamic> datasMapByTabIndexList =new RxMap();


  late TabController tabController;

  void initTabService(Map<String,String> tabLabelMap){
    this.tabLabelMap = tabLabelMap;
    var cnLabels = getTabLableVal();
    tabController = initTabController();
    tabController.animateTo(0,duration: Duration(microseconds: 200),curve: Curves.linear);
    tabController.addListener(()=>tabChange(tabController.index));
    for(int i=0;i<cnLabels.length;i++){
      EasyRefreshController refreshController = EasyRefreshController(
        controlFinishRefresh: true,
        controlFinishLoad: true,
      );
      tabPageNumberMap[i] = 1;
      tabControllers[i] = refreshController;
      putScrollController(i);
    }
  }

  @protected
  String getUniqueId() {
    return T.toString(); // 通过 T 的类型来获取类名
  }


  @protected
  void putScrollController(int index) {
    var scrollController = scrollControllers[getUniqueId()];
    if(!scrollControllers.containsKey(getUniqueId())){
      scrollControllers[getUniqueId()] = [];
      scrollController = [];
    }
    scrollController!.add(new ScrollController());

    scrollControllers[getUniqueId()] = scrollController;
  }


  ScrollController getScrollControllers(int index) {
    return  scrollControllers[getUniqueId()]![index];;
  }

  EasyRefreshController getEasyRefreshController({int? index=-1}){
    index = index==-1?this.tabActiveIndex.value:index;
    return tabControllers[index]!;
  }


  List<String> getTabLableVal(){
    return tabLabelMap.values.toList();
  }

  getResultData({int? index}){
    var _index = index==null?tabActiveIndex.value:index;
    return datasMapByTabIndexList.containsKey(_index)?  datasMapByTabIndexList[_index]:[];
  }

  Future<void> getMoreData() async  {
    getDataReq(callBack: () => {getEasyRefreshController().finishLoad(),getEasyRefreshController().resetHeader()});
  }


  Future<void> getRefresh() async {
    updatePageNumber(1);
    datasMapByTabIndexList.removeWhere((key, value) => key==tabActiveIndex.value);
     getDataReq(callBack: () => {getEasyRefreshController().finishRefresh(),getEasyRefreshController().resetFooter(),getEasyRefreshController().resetHeader()});
  }


  @protected
  addOnePageNumber(){
    return this.tabPageNumberMap[this.tabActiveIndex.value] = this.tabPageNumberMap[this.tabActiveIndex.value]!+1;
  }

  @protected
  updatePageNumber(index){
    this.tabPageNumberMap[this.tabActiveIndex.value] = index;
  }


  // tab切换事件
  tabChange(int index){
    if (tabController.index == tabController.animation!.value) {
      tabActiveIndex.value = index;
      var list = getResultData();
      if(list.length == 0){
        Future.delayed(Duration(milliseconds: 100), () {
          getEasyRefreshController().callRefresh();
        });
      }
    }

  }
  getDataReq({Function? callBack}){
    getData(callBack: callBack);
  }
  int getPageByTabIndex(){
    return this.tabPageNumberMap[this.tabActiveIndex.value]!;
  }


  getData({Function? callBack});
  TabController initTabController();

}
