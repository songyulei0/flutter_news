import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:teemo_news/pages/account_page/account_view.dart';
import 'package:teemo_news/pages/forum_page/forum_logic.dart';
import 'package:teemo_news/pages/job_page/view.dart';
import 'package:teemo_news/pages/old_good/view.dart';

import '../forum_page/forum_view.dart';
import '../newsPage/news_flw_page/news_flw_logic.dart';
import '../newsPage/news_flw_page/news_flw_view.dart';
import '../old_good/logic.dart';

class HomeLogic extends GetxController{
  RxInt currentIndex = RxInt(0);
  List<Widget> pages = [News_flwPage(), Old_goodPage(), ForumPage(),JobPage(),AccountPage()];

  static int currentIntTime = 0;

  void updateIndex(var index) {
    if(index == currentIndex.value){
      currentIntTime=currentIntTime+1;
      clear();
      if(currentIntTime>=2){
        // 需要刷新本页面
        refreshPageData(index,hasData:false);
        currentIntTime = 0;
        return;
      }
    }else{
      // 新页面进入 也需要刷新 [首页会默认加载一次,所以无需判定]
      currentIntTime = 0;
      refreshPageData(index);
    }
    if(index>=pages.length) return;
    this.currentIndex.value = index;
  }


  // 在短时间 类连续两次的点击 将可以快速取消
  void clear(){
    Timer.periodic(Duration(milliseconds: 500), (Timer timer) {
      currentIntTime = 0;
      timer.cancel();
    });
  }

  void refreshPageData(int index,{bool hasData = true}){
    if(index == 0){
      final logic = Get.find<News_flwLogic>();
      if(hasData && logic.getResultData().length > 0) return;
      logic.getEasyRefreshController(index: -1).callRefresh();
    }
    if(index == 1){
      final oldLogic = Get.find<Old_goodLogic>();
      if(hasData && oldLogic.getResultData().length > 0) return;
      oldLogic.getEasyRefreshController().callRefresh();
    }
    if(index == 2){
      final logic = Get.find<ForumLogic>();
      if(hasData && logic.infos.length > 0) return;
      logic.initData();
    }
    if(index == 3){
      // final jobLogic = Get.find<JobLogic>();
      // jobLogic.hasShow.value = true;
      // Get.to(new JobPage())!.then((v)=>updateIndex(0));
    }
  }
}
