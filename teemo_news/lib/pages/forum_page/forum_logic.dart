import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../api/newsApi.dart';
import '../../bean/forum_bean_entity.dart';

class ForumLogic extends GetxController {
  final api = Get.find<newsApi>();
  int pageNumber = 1;
  RxList<ForumBeanEntity> infos =new RxList();


 var forum_refreshController = EasyRefreshController(
  controlFinishRefresh: true,
  controlFinishLoad: true,
  );

  List<dynamic> icons = [
    {
      "icon":Icon(Icons.share_outlined),
      "click":(int index) => Get.find<ForumLogic>().share(index),
      "text":"分析"
    },
    {
    "name":"comment_count",
      "icon":Icon(Icons.chat_bubble_outline),
      "click":(int index) => Get.find<ForumLogic>().chat(index),
      "text":"10"
    },
    {
      "name":"applaud_count",
      "icon":Icon(Icons.thumb_up_alt_outlined),
      "click":(int index) => Get.find<ForumLogic>().thumbUp(index),
      "text":"点赞"
    }
  ];


  void share(int index) {
    print("share up clicked, index: $index");
  }

  void chat(int index) {
    print("chat up clicked, index: $index");
  }

  void thumbUp(int index) {
    print("thumbUp up clicked, index: $index");
  }

  initData(){
    if(infos.length==0){
      forum_refreshController.callRefresh();
    }
  }

  getData({Function? callBack}){
    api.getForum(pageNumber).then((value) {
      var nv = value.removeWhere((element) => element.title=="");
      infos.value =  [...infos ,...value];
      if (value.length > 0) pageNumber += 1;
      if(callBack!=null) callBack();
    });
  }

  getRefresh() {
    pageNumber = 1;
    infos.clear();
    getData(callBack: () => {forum_refreshController.finishRefresh(),forum_refreshController.resetHeader()});
  }

  getMoreDate() {
    getData(callBack: () => {forum_refreshController.finishLoad(),forum_refreshController.resetHeader()});
  }

}
