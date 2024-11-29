import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:teemo_news/bean/user_info_entity.dart';
import 'package:teemo_news/pages/account_page/account_view.dart';
import 'package:teemo_news/pages/home/view.dart';
import 'package:teemo_news/pages/login_page/user_auth_service.dart';

class LoginLogic extends GetxController {

  final userAuthService = Get.find<UserAuthService>();


  RxList<Widget> loginIcons=[
    InkWell(child: Brand(Brands.google,),onTap: ()=>Get.find<LoginLogic>().googleAuth(),),
    Brand(Brands.wechat),
    Brand(Brands.qq),
  ].obs;

  GoogleSignIn  _googleSignIn = new GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void onReady() {
    super.onReady();
  }
  void googleAuth() async{
    EasyLoading.show(status: "登录中....");
    _googleSignIn.signIn().then((value) => {
      EasyLoading.dismiss(),
      userAuthService.setUserInfo(UserInfoEntity().copyWith(
        name: "${value!.displayName}",avatar: "${value.photoUrl}",
        platform: "google",id: "${value.id}"
      )),
      loginDone()
    }).catchError((e)=>{
      print("遇到错误${e}"),
      EasyLoading.showToast("遇到错误,请稍后再试...")
    });
  }


  @protected
  void loginDone(){
    EasyLoading.showToast("登录成功");
    Get.off(new HomePage());
  }

}


