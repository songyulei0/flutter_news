import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teemo_news/generated/json/base/json_convert_content.dart';
import 'package:teemo_news/pages/forum_page/forum_push_page/forum_push_view.dart';
import 'package:teemo_news/utils/ImageUtils.dart';

import '../../bean/forum_bean_entity.dart';
import '../../utils/CommonUtils.dart';
import '../../utils/SkeletonUtils.dart';
import '../newsPage/detail_page/detail_view.dart';
import 'forum_logic.dart';

class ForumPage extends StatelessWidget {
  ForumPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ForumLogic>();
    return Obx(() {
      return Container(
        color: Colors.grey.shade100,
        child: SafeArea(
          child: Scaffold(
            floatingActionButton: logic.infos.length ==0?Container():OutlinedButton(child: Text("发布"),onPressed: ()=>Get.to(new Forum_pushPage()),),
            body: EasyRefresh(
              controller: logic.forum_refreshController,
              onRefresh: () => logic.getRefresh(),
              onLoad: () => logic.getMoreDate(),
              header: CommonUtils.getEasyHeader(),
              footer: CommonUtils.getEasyFooter(),
              child: logic.infos.length==0?SkeletonUtils.getSkeletonByType(type: 2,fullSize: MediaQuery.of(context).size
              ):ListView.builder(
                itemBuilder: (c, i) =>contentCard(i,context),
                itemCount: logic.infos.length,
                // physics: BouncingScrollPhysics(),
                cacheExtent: ScreenUtil.defaultSize.height * .8,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget contentCard(int i,BuildContext context) {
    final logic = Get.find<ForumLogic>();
    ForumBeanEntity info = logic.infos[i];
    bool hasImg = (info.picsArr!=null && info.picsArr!.length>1);

    var fullSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Get.to(() =>
      new DetailPage(),arguments: {
        "url": info.link.toString(),
        "title": info.title!,
      }),
      child: Container(
        margin: EdgeInsets.all(5.sp),
        height: hasImg ? 320.h : 250.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        padding: EdgeInsets.all(10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头像信息
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageUtils.getImageCachedAndHead(
                      "${info.user!.head}", 100,
                      w: 45.sp, h: 45.sp,errorWidget:Image.asset("assets/defaulAvatar.png")),
                  Container(
                    margin: EdgeInsets.only(left: 10.sp),
                    height: 50.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          info.userName!,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Text(
                          "${info.publishTimeStr}",
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 11.sp),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // 内容区域
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${info.title}",
                        style: TextStyle(
                            fontSize: 14.sp, overflow: TextOverflow.ellipsis)),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      "${info.des}",
                      maxLines: 3,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (hasImg) ...[
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            info.picsArr!.length,
                                (index) =>
                                ImageUtils.getImageCachedAndHead(
                                    "${info.picsArr![index].tburl}",10,
                                    w: ((fullSize.width)/ info.picsArr!.length)-18.w,
                                    h: ScreenUtil().setHeight(100),),
                          ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(logic.icons.length,
                        (index) => rowChild(logic.icons[index], index, info)))
          ],
        ),
      ),
    );
  }

  Widget rowChild(var iconBean, int index, ForumBeanEntity info) {
    String text = iconBean['text'];
    if (iconBean.containsKey("name")) {
      text = info.toJson().getOrNull<String>(iconBean['name'])! ;

    }
    return InkWell(
      onTap: () => iconBean['click'](index),
      child: Row(
        children: [
          IconButton(onPressed: null, icon: iconBean['icon']),
          Text("${text}")
        ],
      ),
    );
  }
}
