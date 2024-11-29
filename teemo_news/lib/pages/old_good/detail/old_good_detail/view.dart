import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teemo_news/bean/old_good_index_entity.dart';
import 'package:teemo_news/utils/ImageUtils.dart';

import 'logic.dart';

class Old_good_detailPage extends StatelessWidget {
  Old_good_detailPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    final logic = Get.find<Old_good_detailLogic>();
    print(logic.title);
    return Scaffold(
      appBar: AppBar(title: Text("${logic.title}",maxLines: 1,style: TextStyle(fontSize: 14.sp),),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  ImageUtils.getImageCachedAndHead("${logic.oldGoodIndexEntity.avatar}", 50,w: 50,h: 50),
                  SizedBox(width: 10.w,),
                  Text("${logic.oldGoodIndexEntity.username}")
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(child: Text("${logic.oldGoodIndexEntity.catname}",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(
                    color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(5))
                  ),padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),),
                  
                  Text("浏览量:${logic.oldGoodIndexEntity.views}",style: TextStyle(color: Colors.grey.shade500),)
                ],
              ),
              SizedBox(height: 10.h,),
              ...List.generate(
                  logic.oldGoodIndexEntity.diycon!.length, (index) {
                OldGoodIndexDiycon diyconMay = logic.oldGoodIndexEntity.diycon![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Text("${diyconMay.name}:", style: TextStyle(color: Colors.cyan),),
                      SizedBox(width: 8.w,),
                      Text("${diyconMay.value}", style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                );
              }),

              SizedBox(height: 10.h,),
              // 内容
              Container(
                child: Text("${logic.oldGoodIndexEntity.con}"),
              ),

              SizedBox(height: 10.h,),
              ...List.generate(
                  logic.oldGoodIndexEntity.imglist!.length, (index) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ImageUtils.getImageCachedAndHead(
                      w: MediaQuery.of(context).size.width *0.95,
                        logic.oldGoodIndexEntity.imglist![index], 5),
                  ))
            ],
          ),
        ),
      ),
    );
  }

}
