import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';

import 'detail_logic.dart';

class JobDetailPage extends StatelessWidget {
  JobDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<JobDetailLogic>();
    return Scaffold(
        appBar: AppBar(
          title: Text(logic.title),
        ),
        body: WebView(
          initialUrl: logic.getUrl(),
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
                  logic.btnHandle(message.message);
                })
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) => logic.onPageFinished(),
        ));
  }
}
