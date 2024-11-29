import 'package:get/get.dart';
import 'package:teemo_news/api/newsApi.dart';
import 'package:teemo_news/pages/account_page/account_logic.dart';
import 'package:teemo_news/pages/forum_page/forum_push_page/forum_push_logic.dart';
import 'package:teemo_news/pages/home/logic.dart';
import 'package:teemo_news/pages/job_page/logic.dart';
import 'package:teemo_news/pages/login_page/user_auth_service.dart';
import 'forum_page/forum_logic.dart';
import 'job_page/job_detail_page/detail_logic.dart';
import 'login_page/login_logic.dart';
import 'newsPage/detail_page/detail_logic.dart';
import 'newsPage/news_flw_page/news_flw_logic.dart';
import 'old_good/detail/old_good_detail/logic.dart';
import 'old_good/logic.dart';

class AllPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLogic>(() => HomeLogic(),fenix: true);
    Get.lazyPut<News_flwLogic>(() => News_flwLogic(),fenix: true);
    Get.lazyPut<newsApi>(() => newsApi(),fenix: true);
    Get.lazyPut(() => DetailLogic(),fenix: true);
    Get.lazyPut(() => ForumLogic(),fenix: true);
    Get.lazyPut(() => AccountLogic(),fenix: true);
    Get.lazyPut(() => LoginLogic(),fenix: true);
    Get.lazyPut(() => Forum_pushLogic(),fenix: true);
    Get.lazyPut(() => UserAuthService(),fenix: true);
    Get.lazyPut(() => Old_goodLogic(),fenix: true);
    Get.lazyPut(() => Old_good_detailLogic(),fenix: true);
    Get.lazyPut(() => JobLogic(),fenix: true);
    Get.lazyPut(() => JobDetailLogic(),fenix: true);
  }
}