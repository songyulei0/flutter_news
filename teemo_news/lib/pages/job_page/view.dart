import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:teemo_news/pages/job_page/job_detail_page/detail_view.dart';

import 'logic.dart';

class JobPage extends StatelessWidget {
  JobPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.put(JobLogic());
    return SafeArea(child: WebView(
      initialUrl: "https://rencai.ph/plugin.php?id=fn_job&themecolor=FF5E61",
      javascriptMode: JavascriptMode.unrestricted,
      debuggingEnabled: false,
      onWebViewCreated: (WebViewController webViewController) {
        print("onWebViewCreated");
        webViewController.clearCache();
        logic.setController(webViewController);
      },
      javascriptChannels: <JavascriptChannel>{
        JavascriptChannel(
            name: 'btAction',
            onMessageReceived: (JavascriptMessage message) {
              var data = jsonDecode(message.message);
              Get.to(()=>new JobDetailPage(),arguments: {
                "url":data['url'],
                "title":data['title'].substring(1),
              });
            })
      },
      onPageFinished: (String url) => logic.onPageFinished(),
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
    ));
  }
}
