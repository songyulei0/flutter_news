import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teemo_news/api/newsApi.dart';

import 'forum_push_logic.dart';

class Forum_pushPage extends StatelessWidget {
  Forum_pushPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Forum_pushLogic>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading:TextButton(child:Text("取消",style: TextStyle(color: Colors.white),),onPressed: ()=>Get.back(),),
        // title: Text(),
        actions: [
          TextButton(onPressed: ()=>{

          }, child: Text("发布",style: TextStyle(color: Colors.white)))
        ],
      ),
      body: Container(),
    );
  }
}