import 'package:teemo_news/generated/json/base/json_convert_content.dart';
import 'package:teemo_news/bean/forum_bean_entity.dart';

ForumBeanEntity $ForumBeanEntityFromJson(Map<String, dynamic> json) {
  final ForumBeanEntity forumBeanEntity = ForumBeanEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    forumBeanEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    forumBeanEntity.title = title;
  }
  final int? picType = jsonConvert.convert<int>(json['pic_type']);
  if (picType != null) {
    forumBeanEntity.picType = picType;
  }
  final List<ForumBeanPicsArr>? picsArr = (json['pics_arr'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ForumBeanPicsArr>(e) as ForumBeanPicsArr)
      .toList();
  if (picsArr != null) {
    forumBeanEntity.picsArr = picsArr;
  }
  final String? from = jsonConvert.convert<String>(json['from']);
  if (from != null) {
    forumBeanEntity.from = from;
  }
  final String? label = jsonConvert.convert<String>(json['label']);
  if (label != null) {
    forumBeanEntity.label = label;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    forumBeanEntity.link = link;
  }
  final String? publishTime = jsonConvert.convert<String>(json['publish_time']);
  if (publishTime != null) {
    forumBeanEntity.publishTime = publishTime;
  }
  final String? publishTimeStr = jsonConvert.convert<String>(
      json['publish_time_str']);
  if (publishTimeStr != null) {
    forumBeanEntity.publishTimeStr = publishTimeStr;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    forumBeanEntity.type = type;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    forumBeanEntity.userId = userId;
  }
  final String? userName = jsonConvert.convert<String>(json['user_name']);
  if (userName != null) {
    forumBeanEntity.userName = userName;
  }
  final String? click = jsonConvert.convert<String>(json['click']);
  if (click != null) {
    forumBeanEntity.click = click;
  }
  final String? typeValue = jsonConvert.convert<String>(json['type_value']);
  if (typeValue != null) {
    forumBeanEntity.typeValue = typeValue;
  }
  final String? forumName = jsonConvert.convert<String>(json['forum_name']);
  if (forumName != null) {
    forumBeanEntity.forumName = forumName;
  }
  final ForumBeanRedPacket? redPacket = jsonConvert.convert<ForumBeanRedPacket>(
      json['red_packet']);
  if (redPacket != null) {
    forumBeanEntity.redPacket = redPacket;
  }
  final ForumBeanReplyRedPacket? replyRedPacket = jsonConvert.convert<
      ForumBeanReplyRedPacket>(json['reply_red_packet']);
  if (replyRedPacket != null) {
    forumBeanEntity.replyRedPacket = replyRedPacket;
  }
  final List<dynamic>? tags = (json['tags'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (tags != null) {
    forumBeanEntity.tags = tags;
  }
  final String? coverType = jsonConvert.convert<String>(json['cover_type']);
  if (coverType != null) {
    forumBeanEntity.coverType = coverType;
  }
  final int? coverSet = jsonConvert.convert<int>(json['cover_set']);
  if (coverSet != null) {
    forumBeanEntity.coverSet = coverSet;
  }
  final String? applaudCount = jsonConvert.convert<String>(
      json['applaud_count']);
  if (applaudCount != null) {
    forumBeanEntity.applaudCount = applaudCount;
  }
  final String? des = jsonConvert.convert<String>(json['des']);
  if (des != null) {
    forumBeanEntity.des = des;
  }
  final bool? isApplaud = jsonConvert.convert<bool>(json['is_applaud']);
  if (isApplaud != null) {
    forumBeanEntity.isApplaud = isApplaud;
  }
  final ForumBeanShareInfo? shareInfo = jsonConvert.convert<ForumBeanShareInfo>(
      json['share_info']);
  if (shareInfo != null) {
    forumBeanEntity.shareInfo = shareInfo;
  }
  final String? styleType = jsonConvert.convert<String>(json['style_type']);
  if (styleType != null) {
    forumBeanEntity.styleType = styleType;
  }
  final String? commentCount = jsonConvert.convert<String>(
      json['comment_count']);
  if (commentCount != null) {
    forumBeanEntity.commentCount = commentCount;
  }
  final int? picsCount = jsonConvert.convert<int>(json['pics_count']);
  if (picsCount != null) {
    forumBeanEntity.picsCount = picsCount;
  }
  final ForumBeanUser? user = jsonConvert.convert<ForumBeanUser>(json['user']);
  if (user != null) {
    forumBeanEntity.user = user;
  }
  return forumBeanEntity;
}

Map<String, dynamic> $ForumBeanEntityToJson(ForumBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['pic_type'] = entity.picType;
  data['pics_arr'] = entity.picsArr?.map((v) => v.toJson()).toList();
  data['from'] = entity.from;
  data['label'] = entity.label;
  data['link'] = entity.link;
  data['publish_time'] = entity.publishTime;
  data['publish_time_str'] = entity.publishTimeStr;
  data['type'] = entity.type;
  data['user_id'] = entity.userId;
  data['user_name'] = entity.userName;
  data['click'] = entity.click;
  data['type_value'] = entity.typeValue;
  data['forum_name'] = entity.forumName;
  data['red_packet'] = entity.redPacket?.toJson();
  data['reply_red_packet'] = entity.replyRedPacket?.toJson();
  data['tags'] = entity.tags;
  data['cover_type'] = entity.coverType;
  data['cover_set'] = entity.coverSet;
  data['applaud_count'] = entity.applaudCount;
  data['des'] = entity.des;
  data['is_applaud'] = entity.isApplaud;
  data['share_info'] = entity.shareInfo?.toJson();
  data['style_type'] = entity.styleType;
  data['comment_count'] = entity.commentCount;
  data['pics_count'] = entity.picsCount;
  data['user'] = entity.user?.toJson();
  return data;
}

extension ForumBeanEntityExtension on ForumBeanEntity {
  ForumBeanEntity copyWith({
    int? id,
    String? title,
    int? picType,
    List<ForumBeanPicsArr>? picsArr,
    String? from,
    String? label,
    String? link,
    String? publishTime,
    String? publishTimeStr,
    int? type,
    String? userId,
    String? userName,
    String? click,
    String? typeValue,
    String? forumName,
    ForumBeanRedPacket? redPacket,
    ForumBeanReplyRedPacket? replyRedPacket,
    List<dynamic>? tags,
    String? coverType,
    int? coverSet,
    String? applaudCount,
    String? des,
    bool? isApplaud,
    ForumBeanShareInfo? shareInfo,
    String? styleType,
    String? commentCount,
    int? picsCount,
    ForumBeanUser? user,
  }) {
    return ForumBeanEntity()
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..picType = picType ?? this.picType
      ..picsArr = picsArr ?? this.picsArr
      ..from = from ?? this.from
      ..label = label ?? this.label
      ..link = link ?? this.link
      ..publishTime = publishTime ?? this.publishTime
      ..publishTimeStr = publishTimeStr ?? this.publishTimeStr
      ..type = type ?? this.type
      ..userId = userId ?? this.userId
      ..userName = userName ?? this.userName
      ..click = click ?? this.click
      ..typeValue = typeValue ?? this.typeValue
      ..forumName = forumName ?? this.forumName
      ..redPacket = redPacket ?? this.redPacket
      ..replyRedPacket = replyRedPacket ?? this.replyRedPacket
      ..tags = tags ?? this.tags
      ..coverType = coverType ?? this.coverType
      ..coverSet = coverSet ?? this.coverSet
      ..applaudCount = applaudCount ?? this.applaudCount
      ..des = des ?? this.des
      ..isApplaud = isApplaud ?? this.isApplaud
      ..shareInfo = shareInfo ?? this.shareInfo
      ..styleType = styleType ?? this.styleType
      ..commentCount = commentCount ?? this.commentCount
      ..picsCount = picsCount ?? this.picsCount
      ..user = user ?? this.user;
  }
}

ForumBeanPicsArr $ForumBeanPicsArrFromJson(Map<String, dynamic> json) {
  final ForumBeanPicsArr forumBeanPicsArr = ForumBeanPicsArr();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    forumBeanPicsArr.url = url;
  }
  final String? tburl = jsonConvert.convert<String>(json['tburl']);
  if (tburl != null) {
    forumBeanPicsArr.tburl = tburl;
  }
  final int? width = jsonConvert.convert<int>(json['width']);
  if (width != null) {
    forumBeanPicsArr.width = width;
  }
  final int? height = jsonConvert.convert<int>(json['height']);
  if (height != null) {
    forumBeanPicsArr.height = height;
  }
  final String? videoUrl = jsonConvert.convert<String>(json['video_url']);
  if (videoUrl != null) {
    forumBeanPicsArr.videoUrl = videoUrl;
  }
  return forumBeanPicsArr;
}

Map<String, dynamic> $ForumBeanPicsArrToJson(ForumBeanPicsArr entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['tburl'] = entity.tburl;
  data['width'] = entity.width;
  data['height'] = entity.height;
  data['video_url'] = entity.videoUrl;
  return data;
}

extension ForumBeanPicsArrExtension on ForumBeanPicsArr {
  ForumBeanPicsArr copyWith({
    String? url,
    String? tburl,
    int? width,
    int? height,
    String? videoUrl,
  }) {
    return ForumBeanPicsArr()
      ..url = url ?? this.url
      ..tburl = tburl ?? this.tburl
      ..width = width ?? this.width
      ..height = height ?? this.height
      ..videoUrl = videoUrl ?? this.videoUrl;
  }
}

ForumBeanRedPacket $ForumBeanRedPacketFromJson(Map<String, dynamic> json) {
  final ForumBeanRedPacket forumBeanRedPacket = ForumBeanRedPacket();
  final int? hasRedPacket = jsonConvert.convert<int>(json['has_red_packet']);
  if (hasRedPacket != null) {
    forumBeanRedPacket.hasRedPacket = hasRedPacket;
  }
  final String? redPacketHoverPic = jsonConvert.convert<String>(
      json['red_packet_hover_pic']);
  if (redPacketHoverPic != null) {
    forumBeanRedPacket.redPacketHoverPic = redPacketHoverPic;
  }
  final String? detailRedDes = jsonConvert.convert<String>(
      json['detail_red_des']);
  if (detailRedDes != null) {
    forumBeanRedPacket.detailRedDes = detailRedDes;
  }
  final String? redLabel = jsonConvert.convert<String>(json['red_label']);
  if (redLabel != null) {
    forumBeanRedPacket.redLabel = redLabel;
  }
  return forumBeanRedPacket;
}

Map<String, dynamic> $ForumBeanRedPacketToJson(ForumBeanRedPacket entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['has_red_packet'] = entity.hasRedPacket;
  data['red_packet_hover_pic'] = entity.redPacketHoverPic;
  data['detail_red_des'] = entity.detailRedDes;
  data['red_label'] = entity.redLabel;
  return data;
}

extension ForumBeanRedPacketExtension on ForumBeanRedPacket {
  ForumBeanRedPacket copyWith({
    int? hasRedPacket,
    String? redPacketHoverPic,
    String? detailRedDes,
    String? redLabel,
  }) {
    return ForumBeanRedPacket()
      ..hasRedPacket = hasRedPacket ?? this.hasRedPacket
      ..redPacketHoverPic = redPacketHoverPic ?? this.redPacketHoverPic
      ..detailRedDes = detailRedDes ?? this.detailRedDes
      ..redLabel = redLabel ?? this.redLabel;
  }
}

ForumBeanReplyRedPacket $ForumBeanReplyRedPacketFromJson(
    Map<String, dynamic> json) {
  final ForumBeanReplyRedPacket forumBeanReplyRedPacket = ForumBeanReplyRedPacket();
  final int? isOpenReplyRedPacket = jsonConvert.convert<int>(
      json['is_open_reply_red_packet']);
  if (isOpenReplyRedPacket != null) {
    forumBeanReplyRedPacket.isOpenReplyRedPacket = isOpenReplyRedPacket;
  }
  final int? hasReplyRedPacket = jsonConvert.convert<int>(
      json['has_reply_red_packet']);
  if (hasReplyRedPacket != null) {
    forumBeanReplyRedPacket.hasReplyRedPacket = hasReplyRedPacket;
  }
  final String? commentPrompt = jsonConvert.convert<String>(
      json['comment_prompt']);
  if (commentPrompt != null) {
    forumBeanReplyRedPacket.commentPrompt = commentPrompt;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    forumBeanReplyRedPacket.link = link;
  }
  final String? detailCoverIdUrl = jsonConvert.convert<String>(
      json['detail_cover_id_url']);
  if (detailCoverIdUrl != null) {
    forumBeanReplyRedPacket.detailCoverIdUrl = detailCoverIdUrl;
  }
  final String? bigCoverIdUrl = jsonConvert.convert<String>(
      json['big_cover_id_url']);
  if (bigCoverIdUrl != null) {
    forumBeanReplyRedPacket.bigCoverIdUrl = bigCoverIdUrl;
  }
  final String? des = jsonConvert.convert<String>(json['des']);
  if (des != null) {
    forumBeanReplyRedPacket.des = des;
  }
  final int? startTime = jsonConvert.convert<int>(json['start_time']);
  if (startTime != null) {
    forumBeanReplyRedPacket.startTime = startTime;
  }
  final String? unstartPromptWord = jsonConvert.convert<String>(
      json['unstart_prompt_word']);
  if (unstartPromptWord != null) {
    forumBeanReplyRedPacket.unstartPromptWord = unstartPromptWord;
  }
  final String? unreplyPromptWord = jsonConvert.convert<String>(
      json['unreply_prompt_word']);
  if (unreplyPromptWord != null) {
    forumBeanReplyRedPacket.unreplyPromptWord = unreplyPromptWord;
  }
  final String? wapGuidePromptWord = jsonConvert.convert<String>(
      json['wap_guide_prompt_word']);
  if (wapGuidePromptWord != null) {
    forumBeanReplyRedPacket.wapGuidePromptWord = wapGuidePromptWord;
  }
  final String? auditPromptWord = jsonConvert.convert<String>(
      json['audit_prompt_word']);
  if (auditPromptWord != null) {
    forumBeanReplyRedPacket.auditPromptWord = auditPromptWord;
  }
  final int? redType = jsonConvert.convert<int>(json['red_type']);
  if (redType != null) {
    forumBeanReplyRedPacket.redType = redType;
  }
  final String? commentRedTagLink = jsonConvert.convert<String>(
      json['comment_red_tag_link']);
  if (commentRedTagLink != null) {
    forumBeanReplyRedPacket.commentRedTagLink = commentRedTagLink;
  }
  return forumBeanReplyRedPacket;
}

Map<String, dynamic> $ForumBeanReplyRedPacketToJson(
    ForumBeanReplyRedPacket entity) {
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

extension ForumBeanReplyRedPacketExtension on ForumBeanReplyRedPacket {
  ForumBeanReplyRedPacket copyWith({
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
    return ForumBeanReplyRedPacket()
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

ForumBeanShareInfo $ForumBeanShareInfoFromJson(Map<String, dynamic> json) {
  final ForumBeanShareInfo forumBeanShareInfo = ForumBeanShareInfo();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    forumBeanShareInfo.title = title;
  }
  final String? des = jsonConvert.convert<String>(json['des']);
  if (des != null) {
    forumBeanShareInfo.des = des;
  }
  final String? sharePic = jsonConvert.convert<String>(json['share_pic']);
  if (sharePic != null) {
    forumBeanShareInfo.sharePic = sharePic;
  }
  final String? shareUrl = jsonConvert.convert<String>(json['share_url']);
  if (shareUrl != null) {
    forumBeanShareInfo.shareUrl = shareUrl;
  }
  return forumBeanShareInfo;
}

Map<String, dynamic> $ForumBeanShareInfoToJson(ForumBeanShareInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['des'] = entity.des;
  data['share_pic'] = entity.sharePic;
  data['share_url'] = entity.shareUrl;
  return data;
}

extension ForumBeanShareInfoExtension on ForumBeanShareInfo {
  ForumBeanShareInfo copyWith({
    String? title,
    String? des,
    String? sharePic,
    String? shareUrl,
  }) {
    return ForumBeanShareInfo()
      ..title = title ?? this.title
      ..des = des ?? this.des
      ..sharePic = sharePic ?? this.sharePic
      ..shareUrl = shareUrl ?? this.shareUrl;
  }
}

ForumBeanUser $ForumBeanUserFromJson(Map<String, dynamic> json) {
  final ForumBeanUser forumBeanUser = ForumBeanUser();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    forumBeanUser.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    forumBeanUser.name = name;
  }
  final String? groupIcoSrc = jsonConvert.convert<String>(
      json['group_ico_src']);
  if (groupIcoSrc != null) {
    forumBeanUser.groupIcoSrc = groupIcoSrc;
  }
  final String? head = jsonConvert.convert<String>(json['head']);
  if (head != null) {
    forumBeanUser.head = head;
  }
  final int? certId = jsonConvert.convert<int>(json['cert_id']);
  if (certId != null) {
    forumBeanUser.certId = certId;
  }
  final String? certPicUrl = jsonConvert.convert<String>(json['cert_pic_url']);
  if (certPicUrl != null) {
    forumBeanUser.certPicUrl = certPicUrl;
  }
  final String? medalPicUrl = jsonConvert.convert<String>(
      json['medal_pic_url']);
  if (medalPicUrl != null) {
    forumBeanUser.medalPicUrl = medalPicUrl;
  }
  final int? isVip = jsonConvert.convert<int>(json['is_vip']);
  if (isVip != null) {
    forumBeanUser.isVip = isVip;
  }
  final String? vipNameColor = jsonConvert.convert<String>(
      json['vip_name_color']);
  if (vipNameColor != null) {
    forumBeanUser.vipNameColor = vipNameColor;
  }
  final List<dynamic>? memberGroupIco = (json['member_group_ico'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (memberGroupIco != null) {
    forumBeanUser.memberGroupIco = memberGroupIco;
  }
  final int? isShowCertInfo = jsonConvert.convert<int>(
      json['is_show_cert_info']);
  if (isShowCertInfo != null) {
    forumBeanUser.isShowCertInfo = isShowCertInfo;
  }
  final String? certDes = jsonConvert.convert<String>(json['cert_des']);
  if (certDes != null) {
    forumBeanUser.certDes = certDes;
  }
  final String? headPendantUrl = jsonConvert.convert<String>(
      json['head_pendant_url']);
  if (headPendantUrl != null) {
    forumBeanUser.headPendantUrl = headPendantUrl;
  }
  return forumBeanUser;
}

Map<String, dynamic> $ForumBeanUserToJson(ForumBeanUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['group_ico_src'] = entity.groupIcoSrc;
  data['head'] = entity.head;
  data['cert_id'] = entity.certId;
  data['cert_pic_url'] = entity.certPicUrl;
  data['medal_pic_url'] = entity.medalPicUrl;
  data['is_vip'] = entity.isVip;
  data['vip_name_color'] = entity.vipNameColor;
  data['member_group_ico'] = entity.memberGroupIco;
  data['is_show_cert_info'] = entity.isShowCertInfo;
  data['cert_des'] = entity.certDes;
  data['head_pendant_url'] = entity.headPendantUrl;
  return data;
}

extension ForumBeanUserExtension on ForumBeanUser {
  ForumBeanUser copyWith({
    String? id,
    String? name,
    String? groupIcoSrc,
    String? head,
    int? certId,
    String? certPicUrl,
    String? medalPicUrl,
    int? isVip,
    String? vipNameColor,
    List<dynamic>? memberGroupIco,
    int? isShowCertInfo,
    String? certDes,
    String? headPendantUrl,
  }) {
    return ForumBeanUser()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..groupIcoSrc = groupIcoSrc ?? this.groupIcoSrc
      ..head = head ?? this.head
      ..certId = certId ?? this.certId
      ..certPicUrl = certPicUrl ?? this.certPicUrl
      ..medalPicUrl = medalPicUrl ?? this.medalPicUrl
      ..isVip = isVip ?? this.isVip
      ..vipNameColor = vipNameColor ?? this.vipNameColor
      ..memberGroupIco = memberGroupIco ?? this.memberGroupIco
      ..isShowCertInfo = isShowCertInfo ?? this.isShowCertInfo
      ..certDes = certDes ?? this.certDes
      ..headPendantUrl = headPendantUrl ?? this.headPendantUrl;
  }
}