import 'package:equatable/equatable.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';
import 'package:tikto_app/src/domain/entities/user_state_entity.dart';

class UserFollowingListEntity extends Equatable {
  final int diggCount;
  final int followerCount;
  final int followingCount;
  final int heart;
  final int heartCount;
  final int videoCount;
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
  final bool openFavorite;
  final bool privateAccount;
  final int relation;
  final String secUid;
  final bool secret;
  final String signature;
  final int stitchSetting;
  final bool ttSeller;
  final String uniqueId;
  final bool verified;

  UserFollowingListEntity({
    required this.diggCount,
    required this.followerCount,
    required this.followingCount,
    required this.heart,
    required this.heartCount,
    required this.videoCount,
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
    required this.openFavorite,
    required this.privateAccount,
    required this.relation,
    required this.secUid,
    required this.secret,
    required this.signature,
    required this.stitchSetting,
    required this.ttSeller,
    required this.uniqueId,
    required this.verified,
  });

  @override
  List<Object?> get props => [
        diggCount,
        followerCount,
        followingCount,
        heart,
        heartCount,
        videoCount,
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
        openFavorite,
        privateAccount,
        relation,
        secUid,
        secret,
        signature,
        stitchSetting,
        ttSeller,
        uniqueId,
        verified,
      ];
}
