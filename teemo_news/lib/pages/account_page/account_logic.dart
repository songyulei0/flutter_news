import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:teemo_news/pages/login_page/login_view.dart';
import 'package:teemo_news/pages/login_page/user_auth_service.dart';

class AccountLogic extends GetxController {

  RxList<dynamic> actions = [
    {
      "name":"我的帖子",
      "click":(int index) => Get.find<AccountLogic>().myPost,
      "subtitle":"",
      "icon":Icon(Icons.home),
    },
    {
      "name":"我的评论",
      "click":(int index) => Get.find<AccountLogic>().myComment,
      "subtitle":"",
      "icon":Icon(Icons.chat),
    },
    {
      "name":"关于我们",
      "click":(int index) => Get.find<AccountLogic>().aboutMe,
      "subtitle":"请多关注我~~",
      "icon":Icon(Icons.merge_sharp),
    },
    {
      "name":"系统版本",
      "click":(int index) => {},
      "subtitle":"v1.3.0",
      "icon":Icon(Icons.touch_app_sharp),
    },
    {
      "name":"退出登录",
      "click":(int index) =>  Get.find<AccountLogic>().exitApp(index),
      "subtitle":"",
      "icon":Icon(Icons.exit_to_app),
    },

  ].obs;




   void aboutMe = ()=>{
      // Get.bottomSheet(Text("fdsafdsafds"))
  };

   void exitApp (var index){
     Get.find<UserAuthService>().clearUserInfo();
     Get.off(()=>new LoginPage());
   }

   void myComment =()=>{

   };

   void myPost = ()=>{
     
   };


}
