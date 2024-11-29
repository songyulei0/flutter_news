import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';

class JobLogic extends GetxController {

  late WebViewController detailWebViewController;

  RxBool hasShow = false.obs;

  String jsCode = "";
  @override
  void onInit() {
    // EasyLoading.show(status: "加载中....");

    print("加载中....");

    rootBundle.loadString('assets/jobHid.js')
        .then((value) =>{
      print(value),
      jsCode = value
    }).catchError((e)=>print(e));
    super.onInit();
  }

  void setController(var _d){
    detailWebViewController = _d;
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
}
