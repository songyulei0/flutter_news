import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:get/get.dart';
import 'package:teemo_news/bean/old_good_index_entity.dart';
import 'package:teemo_news/services/TabService.dart';

import '../../api/newsApi.dart';

class Old_goodLogic extends GetxController with SingleGetTickerProviderMixin,TabService<Old_goodLogic> {


  Map<String,Color> typeColors = {
    "二手交易":Colors.pinkAccent,
    "二手车市":Colors.cyan,
    "百货超市":Colors.deepPurpleAccent,
    "家具生活":Colors.teal,
    "家政装潢":Colors.brown,
    "电子科技":Colors.blue,
    "餐饮美食":Colors.green,
    "物流速递":Colors.deepOrangeAccent,

  };


  final api = Get.find<newsApi>();

  var tabKeyMap = {
    "index":"推荐",
    "oldGood":"二手交易",
    "oldCar":"二手车市",
    "oldGoodChilds":"商品买卖",
  };

  var oldGoodChildList = [
    "全部","百货超市","家具生活","电子科技","美容美体","零食生鲜",
  ];

  RxInt oldGoodChildIndex = 0.obs;
  @override
  void onReady() {
    super.onReady();
    // super.getEasyRefreshController().callRefresh();
  }

  @override
  void onInit() {
    super.onInit();
    super.initTabService(tabKeyMap);
  }

  @override
  TabController initTabController() {
    return TabController(length: super.getTabLableVal().length, vsync: this);
  }

  Color getColorByLable(String lable){
    if(typeColors.containsKey(lable)){
      return typeColors[lable]!;
    }
    return Colors.grey;
  }

  updateChildIndex(index){
    oldGoodChildIndex.value = index;
    super.getEasyRefreshController().callRefresh();
  }


  Map<int,int> childPage = {};

  getPageByOldGood(){
    if(childPage.containsKey(oldGoodChildIndex.value)) return childPage[oldGoodChildIndex.value];
    else
      {
        childPage[oldGoodChildIndex.value] = 1;
        return 1;
      }

  }


  getChildRealIndex(){
    // "全部","百货超市","家具生活","电子科技","美容美体","零食生鲜",
    List realIndex = [
      0,15,16,17,18,22
    ];
  return realIndex[ oldGoodChildIndex.value];
  }
  @override
  getData({Function? callBack}) async {
    var res;
    if(tabActiveIndex.value == 0){
      res = await api.getBusinessDistrict<OldGoodIndexEntity>(type: "index",pageSize: getPageByTabIndex(),fromJsonFunction: OldGoodIndexEntity.fromJson);
    }else if(tabActiveIndex.value == 1){
      res = await api.getBusinessDistrict<OldGoodIndexEntity>(type: "oldGood",pageSize: getPageByTabIndex(),fromJsonFunction: OldGoodIndexEntity.fromJson);
    }else if(tabActiveIndex.value == 2){
      res = await api.getBusinessDistrict<OldGoodIndexEntity>(type: "oldCar",pageSize: getPageByTabIndex(),fromJsonFunction: OldGoodIndexEntity.fromJson);
    }

    else{
      // 商品买卖,将会有子元素
      res = await api.getBusinessDistrict<OldGoodIndexEntity>(type: "oldGoodChilds",childId:getChildRealIndex(),pageSize: getPageByTabIndex(),fromJsonFunction: OldGoodIndexEntity.fromJson);
    }



    try {
      if(getPageByTabIndex()==1){
        datasMapByTabIndexList[tabActiveIndex.value] = [];
      }
      var oldData = datasMapByTabIndexList[tabActiveIndex.value];
      oldData=oldData==null?[]:oldData;
      datasMapByTabIndexList[tabActiveIndex.value] =getPageByTabIndex()==1?res:[...oldData,...res];
    } catch (e) {
      print(e);
    }
    if (res.length > 0 && tabActiveIndex.value!=3) addOnePageNumber();
    if (callBack != null) callBack();
  }

  ScrollController getScrollControllerByIndex({required int index}) {
   return super.getScrollControllers(index);
  }



}
