import 'package:teemo_news/generated/json/base/json_field.dart';
import 'package:teemo_news/generated/json/user_info_entity.g.dart';
import 'dart:convert';
export 'package:teemo_news/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
	String name = "";
	String avatar = "";
	String id = "0";
	String remark ="";
	String? platform;

	UserInfoEntity();

	factory UserInfoEntity.fromJson(Map<String, dynamic> json) => $UserInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}