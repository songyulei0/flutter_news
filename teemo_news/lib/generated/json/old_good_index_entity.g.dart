import 'package:teemo_news/generated/json/base/json_convert_content.dart';
import 'package:teemo_news/bean/old_good_index_entity.dart';

OldGoodIndexEntity $OldGoodIndexEntityFromJson(Map<String, dynamic> json) {
  final OldGoodIndexEntity oldGoodIndexEntity = OldGoodIndexEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    oldGoodIndexEntity.id = id;
  }
  final int? cid1 = jsonConvert.convert<int>(json['cid1']);
  if (cid1 != null) {
    oldGoodIndexEntity.cid1 = cid1;
  }
  final int? cid2 = jsonConvert.convert<int>(json['cid2']);
  if (cid2 != null) {
    oldGoodIndexEntity.cid2 = cid2;
  }
  final String? catname = jsonConvert.convert<String>(json['catname']);
  if (catname != null) {
    oldGoodIndexEntity.catname = catname;
  }
  final int? uid = jsonConvert.convert<int>(json['uid']);
  if (uid != null) {
    oldGoodIndexEntity.uid = uid;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    oldGoodIndexEntity.username = username;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    oldGoodIndexEntity.mobile = mobile;
  }
  final String? con = jsonConvert.convert<String>(json['con']);
  if (con != null) {
    oldGoodIndexEntity.con = con;
  }
  final List<OldGoodIndexDiycon>? diycon = (json['diycon'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<OldGoodIndexDiycon>(e) as OldGoodIndexDiycon)
      .toList();
  if (diycon != null) {
    oldGoodIndexEntity.diycon = diycon;
  }
  final String? tags = jsonConvert.convert<String>(json['tags']);
  if (tags != null) {
    oldGoodIndexEntity.tags = tags;
  }
  final List<String>? imglist = (json['imglist'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imglist != null) {
    oldGoodIndexEntity.imglist = imglist;
  }
  final int? display = jsonConvert.convert<int>(json['display']);
  if (display != null) {
    oldGoodIndexEntity.display = display;
  }
  final int? audit = jsonConvert.convert<int>(json['audit']);
  if (audit != null) {
    oldGoodIndexEntity.audit = audit;
  }
  final int? confirm = jsonConvert.convert<int>(json['confirm']);
  if (confirm != null) {
    oldGoodIndexEntity.confirm = confirm;
  }
  final int? endtime = jsonConvert.convert<int>(json['endtime']);
  if (endtime != null) {
    oldGoodIndexEntity.endtime = endtime;
  }
  final int? toptime = jsonConvert.convert<int>(json['toptime']);
  if (toptime != null) {
    oldGoodIndexEntity.toptime = toptime;
  }
  final int? refreshtime = jsonConvert.convert<int>(json['refreshtime']);
  if (refreshtime != null) {
    oldGoodIndexEntity.refreshtime = refreshtime;
  }
  final int? views = jsonConvert.convert<int>(json['views']);
  if (views != null) {
    oldGoodIndexEntity.views = views;
  }
  final int? shares = jsonConvert.convert<int>(json['shares']);
  if (shares != null) {
    oldGoodIndexEntity.shares = shares;
  }
  final int? addtime = jsonConvert.convert<int>(json['addtime']);
  if (addtime != null) {
    oldGoodIndexEntity.addtime = addtime;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    oldGoodIndexEntity.url = url;
  }
  final String? source = jsonConvert.convert<String>(json['source']);
  if (source != null) {
    oldGoodIndexEntity.source = source;
  }
  final int? tid = jsonConvert.convert<int>(json['tid']);
  if (tid != null) {
    oldGoodIndexEntity.tid = tid;
  }
  final int? opentel = jsonConvert.convert<int>(json['opentel']);
  if (opentel != null) {
    oldGoodIndexEntity.opentel = opentel;
  }
  final int? offtheshelf = jsonConvert.convert<int>(json['offtheshelf']);
  if (offtheshelf != null) {
    oldGoodIndexEntity.offtheshelf = offtheshelf;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    oldGoodIndexEntity.avatar = avatar;
  }
  final String? listTpl2Views = jsonConvert.convert<String>(
      json['list_tpl2_views']);
  if (listTpl2Views != null) {
    oldGoodIndexEntity.listTpl2Views = listTpl2Views;
  }
  final String? fabuType = jsonConvert.convert<String>(json['fabu_type']);
  if (fabuType != null) {
    oldGoodIndexEntity.fabuType = fabuType;
  }
  return oldGoodIndexEntity;
}

Map<String, dynamic> $OldGoodIndexEntityToJson(OldGoodIndexEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['cid1'] = entity.cid1;
  data['cid2'] = entity.cid2;
  data['catname'] = entity.catname;
  data['uid'] = entity.uid;
  data['username'] = entity.username;
  data['mobile'] = entity.mobile;
  data['con'] = entity.con;
  data['diycon'] = entity.diycon?.map((v) => v.toJson()).toList();
  data['tags'] = entity.tags;
  data['imglist'] = entity.imglist;
  data['display'] = entity.display;
  data['audit'] = entity.audit;
  data['confirm'] = entity.confirm;
  data['endtime'] = entity.endtime;
  data['toptime'] = entity.toptime;
  data['refreshtime'] = entity.refreshtime;
  data['views'] = entity.views;
  data['shares'] = entity.shares;
  data['addtime'] = entity.addtime;
  data['url'] = entity.url;
  data['source'] = entity.source;
  data['tid'] = entity.tid;
  data['opentel'] = entity.opentel;
  data['offtheshelf'] = entity.offtheshelf;
  data['avatar'] = entity.avatar;
  data['list_tpl2_views'] = entity.listTpl2Views;
  data['fabu_type'] = entity.fabuType;
  return data;
}

extension OldGoodIndexEntityExtension on OldGoodIndexEntity {
  OldGoodIndexEntity copyWith({
    int? id,
    int? cid1,
    int? cid2,
    String? catname,
    int? uid,
    String? username,
    String? mobile,
    String? con,
    List<OldGoodIndexDiycon>? diycon,
    String? tags,
    List<String>? imglist,
    int? display,
    int? audit,
    int? confirm,
    int? endtime,
    int? toptime,
    int? refreshtime,
    int? views,
    int? shares,
    int? addtime,
    String? url,
    String? source,
    int? tid,
    int? opentel,
    int? offtheshelf,
    String? avatar,
    String? listTpl2Views,
    String? fabuType,
  }) {
    return OldGoodIndexEntity()
      ..id = id ?? this.id
      ..cid1 = cid1 ?? this.cid1
      ..cid2 = cid2 ?? this.cid2
      ..catname = catname ?? this.catname
      ..uid = uid ?? this.uid
      ..username = username ?? this.username
      ..mobile = mobile ?? this.mobile
      ..con = con ?? this.con
      ..diycon = diycon ?? this.diycon
      ..tags = tags ?? this.tags
      ..imglist = imglist ?? this.imglist
      ..display = display ?? this.display
      ..audit = audit ?? this.audit
      ..confirm = confirm ?? this.confirm
      ..endtime = endtime ?? this.endtime
      ..toptime = toptime ?? this.toptime
      ..refreshtime = refreshtime ?? this.refreshtime
      ..views = views ?? this.views
      ..shares = shares ?? this.shares
      ..addtime = addtime ?? this.addtime
      ..url = url ?? this.url
      ..source = source ?? this.source
      ..tid = tid ?? this.tid
      ..opentel = opentel ?? this.opentel
      ..offtheshelf = offtheshelf ?? this.offtheshelf
      ..avatar = avatar ?? this.avatar
      ..listTpl2Views = listTpl2Views ?? this.listTpl2Views
      ..fabuType = fabuType ?? this.fabuType;
  }
}

OldGoodIndexDiycon $OldGoodIndexDiyconFromJson(Map<String, dynamic> json) {
  final OldGoodIndexDiycon oldGoodIndexDiycon = OldGoodIndexDiycon();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    oldGoodIndexDiycon.name = name;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    oldGoodIndexDiycon.value = value;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    oldGoodIndexDiycon.sort = sort;
  }
  return oldGoodIndexDiycon;
}

Map<String, dynamic> $OldGoodIndexDiyconToJson(OldGoodIndexDiycon entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['value'] = entity.value;
  data['sort'] = entity.sort;
  return data;
}

extension OldGoodIndexDiyconExtension on OldGoodIndexDiycon {
  OldGoodIndexDiycon copyWith({
    String? name,
    String? value,
    int? sort,
  }) {
    return OldGoodIndexDiycon()
      ..name = name ?? this.name
      ..value = value ?? this.value
      ..sort = sort ?? this.sort;
  }
}