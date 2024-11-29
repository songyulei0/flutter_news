import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teemo_news/pages/login_page/login_view.dart';
import 'package:teemo_news/pages/login_page/user_auth_service.dart';
import 'package:teemo_news/utils/ImageUtils.dart';

import 'account_logic.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AccountLogic>();
    final userInfoService = Get.find<UserAuthService>();
    var userInfo = userInfoService.getUserInfo();

    return SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(() {
            return Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () => {},
                          icon: Icon(Icons.notifications_none)),
                      IconButton(
                          onPressed: () => {}, icon: Icon(Icons.settings))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(userInfo.name.length==0?"---":userInfo.name, style: TextStyle(fontSize: 18.sp),),
                        InkWell(child:
                        ImageUtils.getImageCachedAndHead(userInfo.avatar, 100, w: 50, h: 50,defaultWidth: userInfo.avatar=='null' || userInfo.avatar.length==0?Image.asset("assets/defaulAvatar.png"):null),
                          onTap: () => {}
                        )
                      ],
                    ),
                  ),

                  // SizedBox(height: 10.h,),
                  Divider(height: 10.h,),

                  Expanded(
                    child: ListView.builder(itemBuilder: (c, i) {
                      var info = logic.actions[i];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        selected: true,
                        splashColor: Colors.purple.shade100,
                        selectedColor: Colors.black,
                        leading: info['icon'],
                        title: Text('${info['name']}'),
                        trailing: Container(child: Icon(Icons.keyboard_arrow_right)),
                        subtitle: Text('${info['subtitle'] ?? ''}'),
                        titleAlignment: ListTileTitleAlignment.titleHeight,
                        onTap: () =>info['click'](i),
                      );
                    },
                      itemCount: logic.actions.length,
                      physics: BouncingScrollPhysics(),),
                  )
                ],
              ),
            );
          }),
        ));
  }
}
