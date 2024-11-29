import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';

class DetailLogic extends GetxController {


  late String url;
  late String title;



  static final  String  urlPrx = "https://assapp.flw.com.ph";
  late WebViewController detailWebViewController;

   String jsCode = "";
  @override
  void onInit() {
    EasyLoading.show(status: "加载中....");
    var area = Get.arguments;
    url = area['url'];
    title = area['title'];

    rootBundle.loadString('assets/btnHandle.js')
        .then((value) =>{
          print(value),
        jsCode = value
    }).catchError((e)=>print(e));
    super.onInit();
  }

  void setController(var _d){
    detailWebViewController = _d;
  }

  String getUrl(){
    return url.startsWith("https://") || url.startsWith(urlPrx)?url:(urlPrx+url);
  }
  void btnHandle(String activeBtn){
    switch(activeBtn){
      case "follow_action_btn": followActionBtn(); break;
    }
  }


  void onPageFinished(){
    EasyLoading.dismiss();
    // EasyLoading.showInfo("加载完成");
    detailWebViewController.runJavascript(jsCode);


    // window.onFollowPoster = function() {
    //   alert('Custom onFollowPoster executed');
    //   window.btAction.postMessage('follow_action_btn');
    // };
    // console.log(document.documentElement.outerHTML);
    // // document.getElementById('follow_action').addEventListener('click',function(){
    // //   window.btAction.postMessage('follow_action_btn');
    // // });
    //
  }

  @protected
  void followActionBtn(){
    EasyLoading.showInfo("followActionBtn 点击");
  }
}
