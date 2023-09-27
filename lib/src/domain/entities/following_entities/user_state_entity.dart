import 'package:equatable/equatable.dart';

class UserStatsEntity extends Equatable {
  final String avatarLarger;
  final String avatarMedium;
  final String avatarThumb;
  final int commentSetting;
  final int downloadSetting;
  final int duetSetting;
  final bool ftc;
  final String id;
  final bool isADVirtual;
  final String nickname;
  final String secUid;
  final String uniqueId;

  const UserStatsEntity({
    required this.avatarLarger,
    required this.avatarMedium,
    required this.avatarThumb,
    required this.commentSetting,
    required this.downloadSetting,
    required this.duetSetting,
    required this.ftc,
    required this.id,
    required this.isADVirtual,
    required this.nickname,
    required this.secUid,
    required this.uniqueId,
  });

  @override
  List<Object?> get props => [
        avatarLarger,
        avatarMedium,
        avatarThumb,
        commentSetting,
        downloadSetting,
        duetSetting,
        ftc,
        id,
        isADVirtual,
        nickname,
        secUid,
        uniqueId,
      ];
}
