import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:teemo_news/pages/job_page/job_detail_page/detail_view.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailLogic extends GetxController {
  late String url;
  late String title;

  static final String urlPrx = "https://assapp.flw.com.ph";
  late WebViewController detailWebViewController;

  String jsCode = "";

  @override
  void onInit() {
    EasyLoading.show(status: "加载中....");
    var area = Get.arguments;
    url = area['url'];
    title = area['title'];

    rootBundle
        .loadString('assets/jobDetailHandle.js')
        .then((value) => {jsCode = value})
        .catchError((e) => print(e));
    super.onInit();
  }

  void setController(var _d) {
    detailWebViewController = _d;
  }

  String getUrl() {
    return url;
    // return url.startsWith("https://") || url.startsWith(urlPrx)?url:(urlPrx+url);
  }

  void jumpJobDetail1(Map data) {

  }

  void btnHandle(String msg) {
    var data = jsonDecode(msg);
    switch (data['type']) {
      case "callPhone":
        callPhone(data['phone']);
        break;
      case "jumpJobDetail":
        break;
    }
  }

  void onPageFinished() {
    EasyLoading.dismiss();
    detailWebViewController.runJavascript(jsCode);
  }



  void callPhone(String message) {
    if (message.length > 0 && message.startsWith("tel:")) {
      try {
        launchUrl(Uri.parse(message),
                mode: LaunchMode.externalNonBrowserApplication)
            .then((v) => {});
      } catch (e) {
        print(e);
      }
    }
  }
}
