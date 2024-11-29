import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageUtils {
  static Widget getImageCached(String url,
      {BorderRadius? radius,
      double w = 300,
      double h = 300,
      Widget? defaultWidth,Widget? errorWidget}) {
    return ClipRRect(
      borderRadius: radius != null ? radius : BorderRadius.zero,
      child: defaultWidth != null
          ? Container(width: w, height: h,
          decoration:BoxDecoration(
            color: Colors.grey.shade200
          ) ,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: defaultWidth,
          ))
          : FancyShimmerImage(
              boxFit: BoxFit.cover,
              imageUrl: url,
              width: w,
              height: h,
              errorWidget: errorWidget!=null?errorWidget:Container(
                color: Colors.grey.shade200,
              ),
            ),
    );
  }

  static Widget getImageCachedAndHead(String url, double radius,
      {double w = 300, double h = 300, Widget? defaultWidth,Widget? errorWidget}) {
    return getImageCached(url,
        radius: BorderRadius.circular(radius), w: w, h: h,defaultWidth: defaultWidth,errorWidget:errorWidget==null?defaultWidth:errorWidget);
  }
}
