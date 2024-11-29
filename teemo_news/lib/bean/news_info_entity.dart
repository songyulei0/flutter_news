import 'package:teemo_news/generated/json/base/json_field.dart';
import 'package:teemo_news/generated/json/news_info_entity.g.dart';
import 'dart:convert';
export 'package:teemo_news/generated/json/news_info_entity.g.dart';

@JsonSerializable()
class NewsInfoEntity {
	int? id;
	String? title;
	@JSONField(name: "pic_type")
	int? picType;
	@JSONField(name: "pics_arr")
	List<NewsInfoPicsArr>? picsArr;
	String? from;
	@JSONField(name: "publish_time_str")
	String? publishTimeStr;
	String? label;
	@JSONField(name: "label_id")
	dynamic labelId;
	String? link;
	int? type;
	@JSONField(name: "type_value")
	String? typeValue;
	@JSONField(name: "user_id")
	int? userId;
	dynamic redPacket;
	@JSONField(name: "video_url")
	dynamic videoUrl;
	@JSONField(name: "is_iframe")
	dynamic isIframe;
	dynamic duration;
	dynamic lat;
	dynamic lng;
	int? click;
	@JSONField(name: "cover_type")
	int? coverType;
	@JSONField(name: "pics_count")
	int? picsCount;
	@JSONField(name: "is_vote")
	int? isVote;
	@JSONField(name: "goods_info")
	String? goodsInfo;
	@JSONField(name: "reply_red_packet")
	NewsInfoReplyRedPacket? replyRedPacket;
	List<dynamic>? tags;
	@JSONField(name: "show_content_type")
	dynamic showContentType;
	@JSONField(name: "is_voice")
	int? isVoice;
	String? des;
	String? collection;
	@JSONField(name: "p_circle")
	int? pCircle;
	String? style;
	@JSONField(name: "cover_set")
	int? coverSet;

	NewsInfoEntity();

	factory NewsInfoEntity.fromJson(Map<String, dynamic> json) => $NewsInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $NewsInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NewsInfoPicsArr {
	String? url;
	String? tburl;
	int? width;
	int? height;

	NewsInfoPicsArr();

	factory NewsInfoPicsArr.fromJson(Map<String, dynamic> json) => $NewsInfoPicsArrFromJson(json);

	Map<String, dynamic> toJson() => $NewsInfoPicsArrToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NewsInfoReplyRedPacket {
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

	NewsInfoReplyRedPacket();

	factory NewsInfoReplyRedPacket.fromJson(Map<String, dynamic> json) => $NewsInfoReplyRedPacketFromJson(json);

	Map<String, dynamic> toJson() => $NewsInfoReplyRedPacketToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}