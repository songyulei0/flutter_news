import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonUtils {
  //  半圆（头像）
  static Widget ClipRRectBuild(Widget widget, double count) {
    return ClipRRect(borderRadius: BorderRadius.circular(count), child: widget);
  }

  // 下拉刷新的统一处理
  static getEasyHeader()=> BezierHeader(triggerOffset: 50.h);
  static getEasyFooter()=> BezierFooter(infiniteOffset: 50.h, triggerOffset: 80.sp);
}
