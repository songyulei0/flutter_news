import 'package:teemo_news/generated/json/base/json_field.dart';
import 'package:teemo_news/generated/json/old_good_index_entity.g.dart';
import 'dart:convert';
export 'package:teemo_news/generated/json/old_good_index_entity.g.dart';

@JsonSerializable()
class OldGoodIndexEntity {
	int? id = 0;
	int? cid1 = 0;
	int? cid2 = 0;
	String? catname = '';
	int? uid = 0;
	String? username = '';
	String? mobile = '';
	String? con = '';
	List<OldGoodIndexDiycon>? diycon = [];
	String? tags = '';
	List<String>? imglist = [];
	int? display = 0;
	int? audit = 0;
	int? confirm = 0;
	int? endtime = 0;
	int? toptime = 0;
	int? refreshtime = 0;
	int? views = 0;
	int? shares = 0;
	int? addtime = 0;
	String? url = '';
	String? source = '';
	int? tid = 0;
	int? opentel = 0;
	int? offtheshelf = 0;
	String? avatar = '';
	@JSONField(name: "list_tpl2_views")
	String? listTpl2Views = '';
	@JSONField(name: "fabu_type")
	String? fabuType = '';

	OldGoodIndexEntity();

	factory OldGoodIndexEntity.fromJson(Map<String, dynamic> json) => $OldGoodIndexEntityFromJson(json);

	Map<String, dynamic> toJson() => $OldGoodIndexEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OldGoodIndexDiycon {
	String? name = '';
	String? value = '';
	int? sort = 0;

	OldGoodIndexDiycon();

	factory OldGoodIndexDiycon.fromJson(Map<String, dynamic> json) => $OldGoodIndexDiyconFromJson(json);

	Map<String, dynamic> toJson() => $OldGoodIndexDiyconToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}