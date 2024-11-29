import 'package:teemo_news/generated/json/base/json_field.dart';
import 'package:teemo_news/generated/json/forum_bean_entity.g.dart';
import 'dart:convert';
export 'package:teemo_news/generated/json/forum_bean_entity.g.dart';

@JsonSerializable()
class ForumBeanEntity {
	int? id;
	String? title;
	@JSONField(name: "pic_type")
	int? picType;
	@JSONField(name: "pics_arr")
	List<ForumBeanPicsArr>? picsArr;
	String? from;
	String? label;
	String? link;
	@JSONField(name: "publish_time")
	String? publishTime;
	@JSONField(name: "publish_time_str")
	String? publishTimeStr;
	int? type;
	@JSONField(name: "user_id")
	String? userId;
	@JSONField(name: "user_name")
	String? userName;
	String? click;
	@JSONField(name: "type_value")
	String? typeValue;
	@JSONField(name: "forum_name")
	String? forumName;
	@JSONField(name: "red_packet")
	ForumBeanRedPacket? redPacket;
	@JSONField(name: "reply_red_packet")
	ForumBeanReplyRedPacket? replyRedPacket;
	List<dynamic>? tags;
	@JSONField(name: "cover_type")
	String? coverType;
	@JSONField(name: "cover_set")
	int? coverSet;
	@JSONField(name: "applaud_count")
	String? applaudCount;
	String? des;
	@JSONField(name: "is_applaud")
	bool? isApplaud;
	@JSONField(name: "share_info")
	ForumBeanShareInfo? shareInfo;
	@JSONField(name: "style_type")
	String? styleType;
	@JSONField(name: "comment_count")
	String? commentCount;
	@JSONField(name: "pics_count")
	int? picsCount;
	ForumBeanUser? user;

	ForumBeanEntity();

	factory ForumBeanEntity.fromJson(Map<String, dynamic> json) => $ForumBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $ForumBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForumBeanPicsArr {
	String? url;
	String? tburl;
	int? width;
	int? height;
	@JSONField(name: "video_url")
	String? videoUrl;

	ForumBeanPicsArr();

	factory ForumBeanPicsArr.fromJson(Map<String, dynamic> json) => $ForumBeanPicsArrFromJson(json);

	Map<String, dynamic> toJson() => $ForumBeanPicsArrToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForumBeanRedPacket {
	@JSONField(name: "has_red_packet")
	int? hasRedPacket;
	@JSONField(name: "red_packet_hover_pic")
	String? redPacketHoverPic;
	@JSONField(name: "detail_red_des")
	String? detailRedDes;
	@JSONField(name: "red_label")
	String? redLabel;

	ForumBeanRedPacket();

	factory ForumBeanRedPacket.fromJson(Map<String, dynamic> json) => $ForumBeanRedPacketFromJson(json);

	Map<String, dynamic> toJson() => $ForumBeanRedPacketToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForumBeanReplyRedPacket {
	@JSONField(name: "is_open_reply_red_packet")
	int? isOpenReplyRedPacket;
	@JSONField(name: "has_reply_red_packet")
	int? hasReplyRedPacket;
	@JSONField(name: "comment_prompt")
	String? commentPrompt;
	String? link;
	@JSONField(name: "detail_cover_id_url")
	String? detailCoverIdUrl;
	@JSONField(name: "big_cover_id_url")
	String? bigCoverIdUrl;
	String? des;
	@JSONField(name: "start_time")
	int? startTime;
	@JSONField(name: "unstart_prompt_word")
	String? unstartPromptWord;
	@JSONField(name: "unreply_prompt_word")
	String? unreplyPromptWord;
	@JSONField(name: "wap_guide_prompt_word")
	String? wapGuidePromptWord;
	@JSONField(name: "audit_prompt_word")
	String? auditPromptWord;
	@JSONField(name: "red_type")
	int? redType;
	@JSONField(name: "comment_red_tag_link")
	String? commentRedTagLink;

	ForumBeanReplyRedPacket();

	factory ForumBeanReplyRedPacket.fromJson(Map<String, dynamic> json) => $ForumBeanReplyRedPacketFromJson(json);

	Map<String, dynamic> toJson() => $ForumBeanReplyRedPacketToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForumBeanShareInfo {
	String? title;
	String? des;
	@JSONField(name: "share_pic")
	String? sharePic;
	@JSONField(name: "share_url")
	String? shareUrl;

	ForumBeanShareInfo();

	factory ForumBeanShareInfo.fromJson(Map<String, dynamic> json) => $ForumBeanShareInfoFromJson(json);

	Map<String, dynamic> toJson() => $ForumBeanShareInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForumBeanUser {
	String? id;
	String? name;
	@JSONField(name: "group_ico_src")
	String? groupIcoSrc;
	String? head;
	@JSONField(name: "cert_id")
	int? certId;
	@JSONField(name: "cert_pic_url")
	String? certPicUrl;
	@JSONField(name: "medal_pic_url")
	String? medalPicUrl;
	@JSONField(name: "is_vip")
	int? isVip;
	@JSONField(name: "vip_name_color")
	String? vipNameColor;
	@JSONField(name: "member_group_ico")
	List<dynamic>? memberGroupIco;
	@JSONField(name: "is_show_cert_info")
	int? isShowCertInfo;
	@JSONField(name: "cert_des")
	String? certDes;
	@JSONField(name: "head_pendant_url")
	String? headPendantUrl;

	ForumBeanUser();

	factory ForumBeanUser.fromJson(Map<String, dynamic> json) => $ForumBeanUserFromJson(json);

	Map<String, dynamic> toJson() => $ForumBeanUserToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}