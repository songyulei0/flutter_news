
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:teemo_news/api/newsApi.dart';
import 'package:teemo_news/bean/news_info_entity.dart';
import 'package:teemo_news/services/TabService.dart';

class News_flwLogic extends GetxController with SingleGetTickerProviderMixin,TabService<News_flwLogic>{


  final api = Get.find<newsApi>();

  var tabKeyMap = {
    "index":"推荐",
    "gj_new":"国际",
    "zh_new":"中国",
    "kj_new":"科技",
  };

  @override
  void onReady() {
    super.onReady();
    super.getEasyRefreshController().callRefresh();
  }
  @override
  void onInit() {
    super.onInit();
    super.initTabService(tabKeyMap);
  }

  @override
  getData({Function? callBack}) {
    api.getHotNews(super.getPageByTabIndex(),tabKeyMap.keys.toList()[tabActiveIndex.value]).then((value) {
      List<NewsInfoEntity>? list = datasMapByTabIndexList.containsKey(tabActiveIndex.value)?datasMapByTabIndexList[tabActiveIndex.value]:[];
      list = [...?list, ...value];
      datasMapByTabIndexList[tabActiveIndex.value] = list;
      if (value.length > 0) addOnePageNumber();
      if (callBack != null) callBack();
    });
  }

  @override
  TabController initTabController() {
    return TabController(length: super.getTabLableVal().length, vsync: this);
  }
}
