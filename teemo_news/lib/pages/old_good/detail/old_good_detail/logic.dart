import 'package:get/get.dart';
import 'package:teemo_news/bean/old_good_index_entity.dart';

class Old_good_detailLogic extends GetxController {

  String title = "";

  OldGoodIndexEntity oldGoodIndexEntity = new OldGoodIndexEntity();

  @override
  void onInit() {
    super.onInit();
    var area = Get.arguments;
    title = area['title'];
    oldGoodIndexEntity = area['oldGoodIndexEntity'];

  }
}
