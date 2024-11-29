import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:teemo_news/bean/news_info_entity.dart';
import 'package:teemo_news/generated/json/base/json_convert_content.dart';

import '../bean/forum_bean_entity.dart';

class newsApi extends GetConnect {
  // String getNewsData(){

//  首页
// https://assapp.flw.com.ph/mag/info/v2/channel/infoListByCatId?p=1&cat_id=10&uniqid=5d0b8da87f55a&step=20&channel_id=20&is_app_first=-1&

  // 分页
// https://assapp.flw.com.ph/mag/info/v2/channel/infoListByCatId?p=2&content_id=49809%2C49808%2C49793%2C49792%2C49791%2C49790%2C49789%2C49785%2C49771%2C49770%2C49769%2C49768%2C49767%2C49766%2C49765%2C49764%2C49763%2C49762%2C49625%2C49624&cat_id=10&uniqid=5d0b8da87f55a&step=20&channel_id=20&is_app_first=-1&

// 中国新闻
// https://assapp.flw.com.ph/mag/info/v2/channel/infoListByCatId?p=1&cat_id=12&uniqid=5d19830e3fc54&step=20&channel_id=8&is_app_first=1&

// 国际新闻
// https://assapp.flw.com.ph/mag/info/v2/channel/infoListByCatId?p=1&cat_id=14&uniqid=5d19830e3fc54&step=20&channel_id=8&is_app_first=1&

// 科技新闻
//https://assapp.flw.com.ph/mag/info/v2/channel/infoListByCatId?p=1&cat_id=13&uniqid=5d19830e3fc54&step=20&channel_id=8&is_app_first=1&

//论坛
// https://assapp.flw.com.ph/mag/info/v3/info/infoListByCatId?p=1&cat_id=76&step=20&is_app_first=-1&
// https://assapp.flw.com.ph/mag/info/v3/info/infoListByCatId?p=2&cat_id=76&step=20&is_app_first=-1&（翻页）


  final Map<String,String> newTypeMap = {
    "index":"https://assapp.flw.com.ph/mag/info/v2/channel/infoListByCatId?p=%s&cat_id=10",
    "gj_new":"https://assapp.flw.com.ph/mag/info/v2/channel/infoListByCatId?p=%s&cat_id=12",
    "zh_new":"https://assapp.flw.com.ph/mag/info/v2/channel/infoListByCatId?p=%s&cat_id=11",
    "kj_new":"https://assapp.flw.com.ph/mag/info/v2/channel/infoListByCatId?p=%s&cat_id=14",
  };

  final Map<String,List<dynamic>> totalListMap = {};

  Future<List<NewsInfoEntity>> getHotNews(int pageNunmber,String type) async {

    List<NewsInfoEntity> infos = [];
    try {
      if(!newTypeMap.containsKey(type)) return throw Exception("类型不存在");
      String _url = newTypeMap[type]!.replaceAll("%s", pageNunmber.toString());
      List<dynamic> totalList = totalListMap.containsKey(type)?totalListMap[type]!:[];
      if (pageNunmber > 1 && totalList.length>0) {
        int pageIndex = (pageNunmber - 1);
        String contentId = totalList.sublist(pageIndex * 20,((pageIndex * 20 + 20) > totalList.length? totalList.length
                    : (pageIndex * 20 + 20))) .map((e) => e.toString()).join(',');
        _url += "&content_id=" + contentId;
      }
      print("请求：${_url}");
      var result = await get(_url);

      var newsList = getResult(result,
          before: (body) =>
              {if (pageNunmber == 1 &&  body.containsKey('totalList'))totalListMap.putIfAbsent(type, () => body['totalList']) });
      newsList
          .forEach((element) => infos.add(NewsInfoEntity.fromJson(element)));
    } catch (e) {
      print(e);
    }
    return infos;
  }


  Future<List<ForumBeanEntity>> getForum(int pageNunmber) async {
    List<ForumBeanEntity> infos = [];
    String _url = "https://assapp.flw.com.ph/mag/info/v3/info/infoListByCatId?p=${pageNunmber}&cat_id=76&step=20&is_app_first=-1&";
    var result = await get(_url);

    var newsList = getResult(result);
    newsList .forEach((element) => infos.add(ForumBeanEntity.fromJson(element)));
    return infos;
  }

  /**
   * Api 列表
   * https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=5&cid1=0&page=1 【商品买卖 全部】
      https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=5&cid1=22&page=1【零食生鲜】
      https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=5&cid1=18&page=1【美容美体】
      https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=5&cid1=17&page=1【电子科技】
      https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=5&cid1=16&page=1【家居生活】
      https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=5&cid1=15&page=1【百货超市】

      https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=4&cid1=0&page=1 【二手车】
      https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=2&cid1=0&page=2 【分页】
      https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=2&cid1=0&page=1 【商圈首页】
   */
  Future<List<T>>  getBusinessDistrict<T>({required String type,
    required T Function(Map<String, dynamic>) fromJsonFunction,
    int? pageSize = 1,int? childId = 0}) async{
    String url = "";

    switch(type){
      case "index":url = "https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=toindex&page=${pageSize}"; break;
      case "oldGood":url = "https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=2&cid1=0&page=${pageSize}"; break;
      case "oldCar":url = "https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=4&cid1=0&page=${pageSize}"; break;
      case "oldGoodChilds":{
        url = "https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=toindex&page=${pageSize}";
        if(childId!=-1){
          url = "https://w.feilongwang.net/plugin.php?id=zimu_fenlei&model=list&ids=5&cid1=${childId}&page=${pageSize}";
        }
        break;
      }
    }
    String _url = url;
    print(_url);
    var result = await get(_url);
    String itemKey = type=="index"?"randitem":"plists";

    List<T> resList = [];
    try {
      var _d = result.body;
      _d = _d is String ? json.decode(_d):_d;
      if(_d['status'] ==  200){
        _d['data'][itemKey].forEach((element) {
          try {
            resList.add(fromJsonFunction(element));
          } catch (e) {
            print("解析错误,直接丢掉");
          }
        });
        return resList;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }




  @protected
  getResult(var _r, {Function? before}) {
    List rList = [];
    try {
      var body = _r.body;
      if (body['code'] == 100 && body['success'] == true) {
            if (before != null) before(body);
            return body['list'];
          }
    } catch (e) {
      print(e);
    }
    return rList;
  }
}
