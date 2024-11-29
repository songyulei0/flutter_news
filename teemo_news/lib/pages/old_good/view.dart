import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teemo_news/bean/old_good_index_entity.dart';
import 'package:teemo_news/pages/old_good/detail/old_good_detail/view.dart';
import 'package:teemo_news/utils/ImageUtils.dart';
import 'package:teemo_news/utils/SkeletonUtils.dart';

import '../../utils/CommonUtils.dart';
import 'logic.dart';

//商品买卖

class Old_goodPage extends StatelessWidget {
  Old_goodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Old_goodLogic>();
    var h = MediaQuery.of(context).size.height;
    var _childAspectRatio = 0.45;
    if(h<700) _childAspectRatio = 0.45;
    if(h>750 && h<800) _childAspectRatio =0.46;
    if(h>800) _childAspectRatio = 0.47;


    return Obx(() {
      return SafeArea(
          // maintainBottomViewPadding: true,
          child:  DefaultTabController(
            length: logic.getTabLableVal().length,
            child: Scaffold(
                appBar: AppBar(
                    title: TabBar(
                      controller: logic.tabController,
                      tabs: List.generate(
                          logic.getTabLableVal().length,
                              (index) => Tab(
                            text: "${logic.getTabLableVal()[index]}",
                          )),
                      // onTap: (e)=>logic.updateTab(e),
                    )),
              body: TabBarView(
                controller: logic.tabController,
                children: List.generate(logic.getTabLableVal().length,(index) =>  Column(
                  children: [
                    if(logic.tabActiveIndex.value==3)...[
                      // 商品买卖
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Wrap(
                          children: List.generate(logic.oldGoodChildList.length, (index)=>
                              InkWell(
                                onTap:()=>logic.updateChildIndex(index),
                                child: Container(
                                  margin: EdgeInsets.all(6),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: logic.oldGoodChildIndex == index?Colors.blueAccent.shade200:Colors.grey.shade200,
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  child: Text("${logic.oldGoodChildList[index]}",style: TextStyle(color: logic.oldGoodChildIndex == index?Colors.white:Colors.black),),),
                              )),
                        ),
                      )
                    ],
                    Expanded(
                      child: EasyRefresh(
                        // scrollController: logic.getScrollControllerByIndex(index:logic.tabActiveIndex.value),
                        controller: logic.getEasyRefreshController(index: logic.tabActiveIndex.value),
                        onRefresh: () => logic.getRefresh(),
                        onLoad: () => logic.getMoreData(),
                        header: CommonUtils.getEasyHeader(),
                        footer: CommonUtils.getEasyFooter(),
                        child: logic.getResultData(index: index).length==0?SkeletonUtils.getSkeletonByType(type: 3, fullSize: MediaQuery.of(context).size):
                        SingleChildScrollView(
                          child:  Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: GridView.count(
                              crossAxisCount:( (MediaQuery.of(context).size.width) /180).floor(), // 每行显示的列数
                              crossAxisSpacing: 10.0, // 列之间的间距
                              mainAxisSpacing: 10.0, // 行之间的间距
                              childAspectRatio: _childAspectRatio,
                              padding: const EdgeInsets.all(10.0),
                              children: logic.getResultData(index: index).map<Widget>( (item){
                                OldGoodIndexEntity oldGoodIndexEntity = item;
                                String thumbnail = oldGoodIndexEntity.imglist!.length > 0
                                    ? oldGoodIndexEntity.imglist!.first
                                    : "";
                                return InkWell(
                                  onTap: ()=>Get.to(()=>new Old_good_detailPage(),arguments:{
                                    "title":"${oldGoodIndexEntity.con}","oldGoodIndexEntity":oldGoodIndexEntity
                                  } ),
                                  child: Container(
                                    width: (MediaQuery.of(context).size.width) /2,
                                    // height: 400,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            ImageUtils.getImageCachedAndHead(thumbnail, 10,
                                                w: 180.w, h: 250),
                                            Align(
                                              child: Container(
                                                  padding: EdgeInsets.all(1),
                                                  decoration: BoxDecoration(
                                                      color: logic.getColorByLable("${oldGoodIndexEntity.catname}").withOpacity(0.6),
                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                                                  ),
                                                  child:
                                                  Text("${oldGoodIndexEntity.catname}",style: TextStyle(color: Colors.white),)),
                                              alignment: Alignment.topRight,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text(
                                            "${oldGoodIndexEntity.con}",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                overflow: TextOverflow.ellipsis),
                                            maxLines: 2,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ImageUtils.getImageCachedAndHead(
                                                  "${oldGoodIndexEntity.avatar}", 50,
                                                  w: 30, h: 30),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "${oldGoodIndexEntity.username}",
                                                style: TextStyle(
                                                    color: Colors.grey, fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            )

                            // MasonryView(
                            //   itemPadding: 8,
                            //   listOfItem: ,
                            //   numberOfColumn:
                            //   (MediaQuery.of(context).size.width / 180).floor(),
                            //   itemBuilder: (item)
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ));
    });
  }
}
