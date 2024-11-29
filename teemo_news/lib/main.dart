import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:teemo_news/pages/AllPageBinding.dart';
import 'package:teemo_news/pages/home/view.dart';

// adb connect 127.0.0.1:21503
// https://pub.dev/packages/flashy_tab_bar2
void main() {

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //设置为透明
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // if (Platform.isAndroid)
      WebView.platform = AndroidWebView();
  }
  runApp(
      DevicePreview(
        enabled: false,
        tools: [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) =>  ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: GetMaterialApp(
            initialBinding: AllPageBinding(),
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            home: HomePage(),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
              useMaterial3: true,
            ),
            builder: (context, child) {
              child = EasyLoading.init()(context, child);
              child = Scaffold(
                // Global GestureDetector that will dismiss the keyboard
                  body: GestureDetector(
                    onTap: () => hideKeyboard(context),
                    child: child,
                  ));
              child = DevicePreview.appBuilder(context, child);
              return child;
            },
          ),
        ),
      ),
     );
}

// 键盘隐藏
void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
