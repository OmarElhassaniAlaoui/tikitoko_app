import 'package:tikto_app/src/domain/entities/following_entities/user_state_entity.dart';

class UserStatsModel extends UserStatsEntity { 

  const UserStatsModel({
    required String avatarLarger,
    required String avatarMedium,
    required String avatarThumb,
    required int commentSetting,
    required int downloadSetting,
    required int duetSetting,
    required bool ftc,
    required String id,
    required bool isADVirtual,
    required String nickname,
    required String secUid,
    required String uniqueId,
  }) : super(
    avatarLarger: avatarLarger,
    avatarMedium: avatarMedium,
    avatarThumb: avatarThumb,
    commentSetting: commentSetting,
    downloadSetting: downloadSetting,
    duetSetting: duetSetting,
    ftc: ftc,
    id: id,
    isADVirtual: isADVirtual,
    nickname: nickname,
    secUid: secUid,
    uniqueId: uniqueId,
  );

  factory UserStatsModel.fromJson(Map<String, dynamic> json) {
    return UserStatsModel(
      avatarLarger: json['avatarLarger'],
      avatarMedium: json['avatarMedium'],
      avatarThumb: json['avatarThumb'],
      commentSetting: json['commentSetting'],
      downloadSetting: json['downloadSetting'],
      duetSetting: json['duetSetting'],
      ftc: json['ftc'],
      id: json['id'],
      isADVirtual: json['isADVirtual'],
      nickname: json['nickname'],
      secUid: json['secUid'],
      uniqueId: json['uniqueId'],
    );
  }

}