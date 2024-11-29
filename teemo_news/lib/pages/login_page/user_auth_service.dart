import 'package:get/get.dart';
import 'package:teemo_news/bean/user_info_entity.dart';

class UserAuthService extends GetxService{
    UserInfoEntity activeUser = new UserInfoEntity();

    void setUserInfo(UserInfoEntity userInfoEntity){
      this.activeUser = userInfoEntity;
    }

    UserInfoEntity getUserInfo(){
      return activeUser;
    }

    void clearUserInfo(){
      this.activeUser = new UserInfoEntity();
    }
}