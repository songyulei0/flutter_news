import 'package:teemo_news/generated/json/base/json_convert_content.dart';
import 'package:teemo_news/bean/news_info_entity.dart';

NewsInfoEntity $NewsInfoEntityFromJson(Map<String, dynamic> json) {
  final NewsInfoEntity newsInfoEntity = NewsInfoEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    newsInfoEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    newsInfoEntity.title = title;
  }
  final int? picType = jsonConvert.convert<int>(json['pic_type']);
  if (picType != null) {
    newsInfoEntity.picType = picType;
  }
  final List<NewsInfoPicsArr>? picsArr = (json['pics_arr'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsInfoPicsArr>(e) as NewsInfoPicsArr)
      .toList();
  if (picsArr != null) {
    newsInfoEntity.picsArr = picsArr;
  }
  final String? from = jsonConvert.convert<String>(json['from']);
  if (from != null) {
    newsInfoEntity.from = from;
  }
  final String? publishTimeStr = jsonConvert.convert<String>(
      json['publish_time_str']);
  if (publishTimeStr != null) {
    newsInfoEntity.publishTimeStr = publishTimeStr;
  }
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    newsInfoEntity.label = label;
  }
  final dynamic labelId = json['label_id'];
  if (labelId != null) {
    newsInfoEntity.labelId = labelId;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    newsInfoEntity.link = link;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    newsInfoEntity.type = type;
  }
  final String? typeValue = jsonConvert.convert<String>(json['type_value']);
  if (typeValue != null) {
    newsInfoEntity.typeValue = typeValue;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    newsInfoEntity.userId = userId;
  }
  final dynamic redPacket = json['redPacket'];
  if (redPacket != null) {
    newsInfoEntity.redPacket = redPacket;
  }
  final dynamic videoUrl = json['video_url'];
  if (videoUrl != null) {
    newsInfoEntity.videoUrl = videoUrl;
  }
  final dynamic isIframe = json['is_iframe'];
  if (isIframe != null) {
    newsInfoEntity.isIframe = isIframe;
  }
  final dynamic duration = json['duration'];
  if (duration != null) {
    newsInfoEntity.duration = duration;
  }
  final dynamic lat = json['lat'];
  if (lat != null) {
    newsInfoEntity.lat = lat;
  }
  final dynamic lng = json['lng'];
  if (lng != null) {
    newsInfoEntity.lng = lng;
  }
  final int? click = jsonConvert.convert<int>(json['click']);
  if (click != null) {
    newsInfoEntity.click = click;
  }
  final int? coverType = jsonConvert.convert<int>(json['cover_type']);
  if (coverType != null) {
    newsInfoEntity.coverType = coverType;
  }
  final int? picsCount = jsonConvert.convert<int>(json['pics_count']);
  if (picsCount != null) {
    newsInfoEntity.picsCount = picsCount;
  }
  final int? isVote = jsonConvert.convert<int>(json['is_vote']);
  if (isVote != null) {
    newsInfoEntity.isVote = isVote;
  }
  final String? goodsInfo = jsonConvert.convert<String>(json['goods_info']);
  if (goodsInfo != null) {
    newsInfoEntity.goodsInfo = goodsInfo;
  }
  final NewsInfoReplyRedPacket? replyRedPacket = jsonConvert.convert<
      NewsInfoReplyRedPacket>(json['reply_red_packet']);
  if (replyRedPacket != null) {
    newsInfoEntity.replyRedPacket = replyRedPacket;
  }
  final List<dynamic>? tags = (json['tags'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (tags != null) {
    newsInfoEntity.tags = tags;
  }
  final dynamic showContentType = json['show_content_type'];
  if (showContentType != null) {
    newsInfoEntity.showContentType = showContentType;
  }
  final int? isVoice = jsonConvert.convert<int>(json['is_voice']);
  if (isVoice != null) {
    newsInfoEntity.isVoice = isVoice;
  }
  final String? des = jsonConvert.convert<String>(json['des']);
  if (des != null) {
    newsInfoEntity.des = des;
  }
  final String? collection = jsonConvert.convert<String>(json['collection']);
  if (collection != null) {
    newsInfoEntity.collection = collection;
  }
  final int? pCircle = jsonConvert.convert<int>(json['p_circle']);
  if (pCircle != null) {
    newsInfoEntity.pCircle = pCircle;
  }
  final String? style = jsonConvert.convert<String>(json['style']);
  if (style != null) {
    newsInfoEntity.style = style;
  }
  final int? coverSet = jsonConvert.convert<int>(json['cover_set']);
  if (coverSet != null) {
    newsInfoEntity.coverSet = coverSet;
  }
  return newsInfoEntity;
}

Map<String, dynamic> $NewsInfoEntityToJson(NewsInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['pic_type'] = entity.picType;
  data['pics_arr'] = entity.picsArr?.map((v) => v.toJson()).toList();
  data['from'] = entity.from;
  data['publish_time_str'] = entity.publishTimeStr;
  data['label'] = entity.label;
  data['label_id'] = entity.labelId;
  data['link'] = entity.link;
  data['type'] = entity.type;
  data['type_value'] = entity.typeValue;
  data['user_id'] = entity.userId;
  data['redPacket'] = entity.redPacket;
  data['video_url'] = entity.videoUrl;
  data['is_iframe'] = entity.isIframe;
  data['duration'] = entity.duration;
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  data['click'] = entity.click;
  data['cover_type'] = entity.coverType;
  data['pics_count'] = entity.picsCount;
  data['is_vote'] = entity.isVote;
  data['goods_info'] = entity.goodsInfo;
  data['reply_red_packet'] = entity.replyRedPacket?.toJson();
  data['tags'] = entity.tags;
  data['show_content_type'] = entity.showContentType;
  data['is_voice'] = entity.isVoice;
  data['des'] = entity.des;
  data['collection'] = entity.collection;
  data['p_circle'] = entity.pCircle;
  data['style'] = entity.style;
  data['cover_set'] = entity.coverSet;
  return data;
}

extension NewsInfoEntityExtension on NewsInfoEntity {
  NewsInfoEntity copyWith({
    int? id,
    String? title,
    int? picType,
    List<NewsInfoPicsArr>? picsArr,
    String? from,
    String? publishTimeStr,
    String? label,
    dynamic labelId,
    String? link,
    int? type,
    String? typeValue,
    int? userId,
    dynamic redPacket,
    dynamic videoUrl,
    dynamic isIframe,
    dynamic duration,
    dynamic lat,
    dynamic lng,
    int? click,
    int? coverType,
    int? picsCount,
    int? isVote,
    String? goodsInfo,
    NewsInfoReplyRedPacket? replyRedPacket,
    List<dynamic>? tags,
    dynamic showContentType,
    int? isVoice,
    String? des,
    String? collection,
    int? pCircle,
    String? style,
    int? coverSet,
  }) {
    return NewsInfoEntity()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..picType = picType ?? this.picType
      ..picsArr = picsArr ?? this.picsArr
      ..from = from ?? this.from
      ..publishTimeStr = publishTimeStr ?? this.publishTimeStr
      ..label = label ?? this.label
      ..labelId = labelId ?? this.labelId
      ..link = link ?? this.link
      ..type = type ?? this.type
      ..typeValue = typeValue ?? this.typeValue
      ..userId = userId ?? this.userId
      ..redPacket = redPacket ?? this.redPacket
      ..videoUrl = videoUrl ?? this.videoUrl
      ..isIframe = isIframe ?? this.isIframe
      ..duration = duration ?? this.duration
      ..lat = lat ?? this.lat
      ..lng = lng ?? this.lng
      ..click = click ?? this.click
      ..coverType = coverType ?? this.coverType
      ..picsCount = picsCount ?? this.picsCount
      ..isVote = isVote ?? this.isVote
      ..goodsInfo = goodsInfo ?? this.goodsInfo
      ..replyRedPacket = replyRedPacket ?? this.replyRedPacket
      ..tags = tags ?? this.tags
      ..showContentType = showContentType ?? this.showContentType
      ..isVoice = isVoice ?? this.isVoice
      ..des = des ?? this.des
      ..collection = collection ?? this.collection
      ..pCircle = pCircle ?? this.pCircle
      ..style = style ?? this.style
      ..coverSet = coverSet ?? this.coverSet;
  }
}

NewsInfoPicsArr $NewsInfoPicsArrFromJson(Map<String, dynamic> json) {
  final NewsInfoPicsArr newsInfoPicsArr = NewsInfoPicsArr();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    newsInfoPicsArr.url = url;
  }
  final String? tburl = jsonConvert.convert<String>(json['tburl']);
  if (tburl != null) {
    newsInfoPicsArr.tburl = tburl;
  }
  final int? width = jsonConvert.convert<int>(json['width']);
  if (width != null) {
    newsInfoPicsArr.width = width;
  }
  final int? height = jsonConvert.convert<int>(json['height']);
  if (height != null) {
    newsInfoPicsArr.height = height;
  }
  return newsInfoPicsArr;
}

Map<String, dynamic> $NewsInfoPicsArrToJson(NewsInfoPicsArr entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['tburl'] = entity.tburl;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

extension NewsInfoPicsArrExtension on NewsInfoPicsArr {
  NewsInfoPicsArr copyWith({
    String? url,
    String? tburl,
    int? width,
    int? height,
  }) {
    return NewsInfoPicsArr()
      ..url = url ?? this.url
      ..tburl = tburl ?? this.tburl
      ..width = width ?? this.width
      ..height = height ?? this.height;
  }
}

NewsInfoReplyRedPacket $NewsInfoReplyRedPacketFromJson(
    Map<String, dynamic> json) {
  final NewsInfoReplyRedPacket newsInfoReplyRedPacket = NewsInfoReplyRedPacket();
  final int? isOpenReplyRedPacket = jsonConvert.convert<int>(
      json['is_open_reply_red_packet']);
  if (isOpenReplyRedPacket != null) {
    newsInfoReplyRedPacket.isOpenReplyRedPacket = isOpenReplyRedPacket;
  }
  final int? hasReplyRedPacket = jsonConvert.convert<int>(
      json['has_reply_red_packet']);
  if (hasReplyRedPacket != null) {
    newsInfoReplyRedPacket.hasReplyRedPacket = hasReplyRedPacket;
  }
  final String? commentPrompt = jsonConvert.convert<String>(
      json['comment_prompt']);
  if (commentPrompt != null) {
    newsInfoReplyRedPacket.commentPrompt = commentPrompt;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    newsInfoReplyRedPacket.link = link;
  }
  final String? detailCoverIdUrl = jsonConvert.convert<String>(
      json['detail_cover_id_url']);
  if (detailCoverIdUrl != null) {
    newsInfoReplyRedPacket.detailCoverIdUrl = detailCoverIdUrl;
  }
  final String? bigCoverIdUrl = jsonConvert.convert<String>(
      json['big_cover_id_url']);
  if (bigCoverIdUrl != null) {
    newsInfoReplyRedPacket.bigCoverIdUrl = bigCoverIdUrl;
  }
  final String? des = jsonConvert.convert<String>(json['des']);
  if (des != null) {
    newsInfoReplyRedPacket.des = des;
  }
  final int? startTime = jsonConvert.convert<int>(json['start_time']);
  if (startTime != null) {
    newsInfoReplyRedPacket.startTime = startTime;
  }
  final String? unstartPromptWord = jsonConvert.convert<String>(
      json['unstart_prompt_word']);
  if (unstartPromptWord != null) {
    newsInfoReplyRedPacket.unstartPromptWord = unstartPromptWord;
  }
  final String? unreplyPromptWord = jsonConvert.convert<String>(
      json['unreply_prompt_word']);
  if (unreplyPromptWord != null) {
    newsInfoReplyRedPacket.unreplyPromptWord = unreplyPromptWord;
  }
  final String? wapGuidePromptWord = jsonConvert.convert<String>(
      json['wap_guide_prompt_word']);
  if (wapGuidePromptWord != null) {
    newsInfoReplyRedPacket.wapGuidePromptWord = wapGuidePromptWord;
  }
  final String? auditPromptWord = jsonConvert.convert<String>(
      json['audit_prompt_word']);
  if (auditPromptWord != null) {
    newsInfoReplyRedPacket.auditPromptWord = auditPromptWord;
  }
  final int? redType = jsonConvert.convert<int>(json['red_type']);
  if (redType != null) {
    newsInfoReplyRedPacket.redType = redType;
  }
  final String? commentRedTagLink = jsonConvert.convert<String>(
      json['comment_red_tag_link']);
  if (commentRedTagLink != null) {
    newsInfoReplyRedPacket.commentRedTagLink = commentRedTagLink;
  }
  return newsInfoReplyRedPacket;
}

Map<String, dynamic> $NewsInfoReplyRedPacketToJson(
    NewsInfoReplyRedPacket entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['is_open_reply_red_packet'] = entity.isOpenReplyRedPacket;
  data['has_reply_red_packet'] = entity.hasReplyRedPacket;
  data['comment_prompt'] = entity.commentPrompt;
  data['link'] = entity.link;
  data['detail_cover_id_url'] = entity.detailCoverIdUrl;
  data['big_cover_id_url'] = entity.bigCoverIdUrl;
  data['des'] = entity.des;
  data['start_time'] = entity.startTime;
  data['unstart_prompt_word'] = entity.unstartPromptWord;
  data['unreply_prompt_word'] = entity.unreplyPromptWord;
  data['wap_guide_prompt_word'] = entity.wapGuidePromptWord;
  data['audit_prompt_word'] = entity.auditPromptWord;
  data['red_type'] = entity.redType;
  data['comment_red_tag_link'] = entity.commentRedTagLink;
  return data;
}

extension NewsInfoReplyRedPacketExtension on NewsInfoReplyRedPacket {
  NewsInfoReplyRedPacket copyWith({
    int? isOpenReplyRedPacket,
    int? hasReplyRedPacket,
    String? commentPrompt,
    String? link,
    String? detailCoverIdUrl,
    String? bigCoverIdUrl,
    String? des,
    int? startTime,
    String? unstartPromptWord,
    String? unreplyPromptWord,
    String? wapGuidePromptWord,
    String? auditPromptWord,
    int? redType,
    String? commentRedTagLink,
  }) {
    return NewsInfoReplyRedPacket()
      ..isOpenReplyRedPacket = isOpenReplyRedPacket ?? this.isOpenReplyRedPacket
      ..hasReplyRedPacket = hasReplyRedPacket ?? this.hasReplyRedPacket
      ..commentPrompt = commentPrompt ?? this.commentPrompt
      ..link = link ?? this.link
      ..detailCoverIdUrl = detailCoverIdUrl ?? this.detailCoverIdUrl
      ..bigCoverIdUrl = bigCoverIdUrl ?? this.bigCoverIdUrl
      ..des = des ?? this.des
      ..startTime = startTime ?? this.startTime
      ..unstartPromptWord = unstartPromptWord ?? this.unstartPromptWord
      ..unreplyPromptWord = unreplyPromptWord ?? this.unreplyPromptWord
      ..wapGuidePromptWord = wapGuidePromptWord ?? this.wapGuidePromptWord
      ..auditPromptWord = auditPromptWord ?? this.auditPromptWord
      ..redType = redType ?? this.redType
      ..commentRedTagLink = commentRedTagLink ?? this.commentRedTagLink;
  }
}