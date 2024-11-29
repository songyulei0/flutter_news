import 'package:teemo_news/generated/json/base/json_convert_content.dart';
import 'package:teemo_news/bean/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
  final UserInfoEntity userInfoEntity = UserInfoEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoEntity.name = name;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    userInfoEntity.avatar = avatar;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userInfoEntity.id = id;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    userInfoEntity.remark = remark;
  }
  final String? platform = jsonConvert.convert<String>(json['platform']);
  if (platform != null) {
    userInfoEntity.platform = platform;
  }
  return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['avatar'] = entity.avatar;
  data['id'] = entity.id;
  data['remark'] = entity.remark;
  data['platform'] = entity.platform;
  return data;
}

extension UserInfoEntityExtension on UserInfoEntity {
  UserInfoEntity copyWith({
    String? name,
    String? avatar,
    String? id,
    String? remark,
    String? platform,
  }) {
    return UserInfoEntity()
      ..name = name ?? this.name
      ..avatar = avatar ?? this.avatar
      ..id = id ?? this.id
      ..remark = remark ?? this.remark
      ..platform = platform ?? this.platform;
  }
}