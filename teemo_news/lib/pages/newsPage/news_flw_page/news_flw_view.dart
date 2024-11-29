import 'package:easy_animate/animation/slide_in_animation.dart';
import 'package:easy_animate/enum/animate_direction.dart';
import 'package:easy_animate/enum/animate_type.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teemo_news/pages/newsPage/detail_page/detail_view.dart';
import 'package:teemo_news/utils/CommonUtils.dart';
import 'package:teemo_news/utils/ImageUtils.dart';
import 'package:teemo_news/utils/SkeletonUtils.dart';

import 'news_flw_logic.dart';

class News_flwPage extends StatelessWidget {
  News_flwPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<News_flwLogic>();
    return Obx(() {
      return DefaultTabController(
        length: logic.getTabLableVal().length,
        child: Scaffold(
            appBar: AppBar(
                // elevation: 0,
                title: TabBar(
              // indicatorWeight:0,
              // indicator: const BoxDecoration(),
              controller: logic.tabController,
              tabs: List.generate(
                  logic.getTabLableVal().length,
                  (index) => Tab(
                        text: "${logic.getTabLableVal()[index]}",
                      )),
              // onTap: (e)=>logic.updateTab(e),
            )),
            body: TabBarView(
              children: List.generate(
                  logic.getTabLableVal().length,
                  (index) => EasyRefresh(
                      // scrollController: logic.getScrollControllers(index),
                      controller: logic.getEasyRefreshController(index: index),
                      onRefresh: () => logic.getRefresh(),
                      onLoad: () => logic.getMoreData(),
                      header: CommonUtils.getEasyHeader(),
                      footer: CommonUtils.getEasyFooter(),
                      child: logic.getResultData(index: index).length ==0?SkeletonUtils.getSkeletonByType(type: 1,fullSize: MediaQuery.of(context).size
                      ):ListView.separated(
                        // reverse: true,
                        // shrinkWrap: false,
                        // physics: BouncingScrollPhysics(),
                        controller: logic.getScrollControllers(index),
                        cacheExtent: ScreenUtil.defaultSize.height * .8,
                        padding: EdgeInsets.all(5.sp),
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(
                          color: Colors.grey.shade100,
                        ),
                        itemBuilder: (c, item) {
                          var data = logic.getResultData(index: index);
                          var info;
                          var twoImage;
                          bool loading = true;
                          try {
                            if (data.length > 0) {
                              info = data[item];
                              twoImage = info.picsArr!.isNotEmpty &&
                                      info.picsArr!.length == 3
                                  ? 3
                                  : 1;
                              loading = false;
                            }
                          } catch (e) {
                            loading = true;
                          }
                          return SlideInAnimation(
                            animateType: AnimateType.once,
                            durationMilliseconds: 600,
                            moveAmount: 200,
                            animateDirection: AnimateDirection.right,
                            child: InkWell(
                              onTap: () =>
                                  Get.to(() => new DetailPage(), arguments: {
                                "url": info.link.toString(),
                                "title": info.title!,
                              }),
                              child: Container(
                                  padding: EdgeInsets.all(5.sp),
                                  height: twoImage == 3 ? 150.h : 100.h,
                                  // width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (info.picsArr!.isNotEmpty &&
                                          info.picsArr!.length == 1) ...[
                                        ImageUtils.getImageCached(
                                            info.picsArr![0].tburl!,
                                            w: 100.w,
                                            radius: BorderRadius.all(
                                                Radius.circular(8.sp))),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                      ],
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            titleBold(info.title.toString()),
                                            if (twoImage == 3) ...[
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 8.sp),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: List.generate(
                                                    info.picsArr!.length,
                                                    (index) => ImageUtils
                                                        .getImageCached(
                                                            info.picsArr![index]
                                                                .tburl!,
                                                            w: (MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    info.picsArr!
                                                                        .length) -
                                                                15.w,
                                                            h: 80.h,
                                                            radius: BorderRadius
                                                                .all(Radius
                                                                    .circular(
                                                                        8.sp))),
                                                  ),
                                                ),
                                              )
                                            ],
                                            Expanded(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  textGrey(info.from!),
                                                  textGrey(
                                                      info.publishTimeStr!),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        },
                        itemCount: logic.getResultData(index: index).length,
                      ))),
              controller: logic.tabController,
            )),
      );
    });
  }

  Widget textGrey(String text) => Text(
        text,
        style: TextStyle(color: Colors.grey.shade500, fontSize: 10.sp),
      );

  Widget titleBold(String text) => Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500),
      );
}
