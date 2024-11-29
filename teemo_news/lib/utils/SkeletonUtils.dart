import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
/**
 * 骨架工具类
 *
 * 主要定义各种页面的骨架
 */


// SkeletonAvatar(
// style: SkeletonAvatarStyle(
// shape: BoxShape.circle, width: 50, height: 50),
// ),


class SkeletonUtils {
  static Widget getSkeletonByType({
    required int type,
    required Size fullSize
  }) {
     if(type == 1) return new SkeletonUtils().skeletonByNews(fullSize: fullSize);
     if(type == 2) return new SkeletonUtils().skeletonByForum(fullSize: fullSize);
     if(type == 3) return new SkeletonUtils().skeletonByOldGood(fullSize: fullSize);
     return new SkeletonUtils().skeletonByNews(fullSize: fullSize);
  }

  /**
   * 新闻级别的骨架
   */
  @protected
  Widget skeletonByNews({required Size fullSize}) {
    return ListView.builder(
      itemCount: (fullSize.height /150) .floor(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.white),
          child: SkeletonItem(
              child:   Row(
                children: [
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        shape: BoxShape.rectangle, width: 100, height: 100),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 8,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 10,
                            borderRadius: BorderRadius.circular(8),
                            minLength: fullSize.width/2,
                            maxLength: fullSize.width/1.5 ,
                          )),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }


  /**
   * 论坛
   */
  @protected
  Widget skeletonByForum({required Size fullSize}) {
    return ListView.builder(
      itemCount: (fullSize.height /150) .floor(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.white),
          child: SkeletonItem(
              child:   Column(
                children: [

                  Row(
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            shape: BoxShape.circle, width: 40, height: 40),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 2,
                              spacing: 10,
                              lineStyle: SkeletonLineStyle(
                                randomLength: true,
                                height: 5,
                                borderRadius: BorderRadius.circular(8),
                                minLength:100,
                                maxLength:150,
                              )),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 10,),
                  SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 4,
                        spacing: 10,
                        lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 5,
                          borderRadius: BorderRadius.circular(8),
                          minLength:fullSize.width/1.5,
                          maxLength:fullSize.width,
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }


  /**
   * 二手交易
   */
  @protected
  Widget skeletonByOldGood({required Size fullSize}) {
    var itemWidth = (fullSize.width - 30) / 2;
    var itemHeight = 230.0.h;
    var childAspectRatio = itemWidth / itemHeight;

    var _itemCount = (fullSize.height/(150.h)).ceil();
    return Container(
      // height: 500,
      width: fullSize.width,
      child: GridView.builder(
        itemCount: _itemCount %2 ==0?_itemCount:(_itemCount+1),
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
            padding:  EdgeInsets.all(10.0),
            child: SkeletonItem(
                child:   Container(
                  child: Column(
                    children: [
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            borderRadius:const BorderRadius.all(Radius.circular(10)),
                            width: double.infinity,
                            height: 180
                        ),
                      ),
                      SizedBox(height: 12),
                      SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 3,
                            spacing: 6,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 2,
                            )),
                      ),
                    ],
                  ),
                )),
          );
        },
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            /// 纵轴间距
            mainAxisSpacing: 1.0,
            /// 横轴间距
            crossAxisSpacing: 1.0,
            /// 横轴元素个数
            crossAxisCount: 2,
            /// 宽高比
            childAspectRatio: childAspectRatio,
          ),
      ),
    );
  }


}
