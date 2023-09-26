import 'package:flutter/material.dart';
import 'package:tikto_app/src/app/routes/app_pages.dart';
import 'package:tikto_app/src/app/themes/app_palette.dart';

class AccountStatModel {
  final String title;
  final String value;
  final String routeName;
  final Color? color;

  AccountStatModel(
      {required this.title,
      required this.value,
      required this.routeName,
      this.color});

  static List<AccountStatModel> getAccountStatus() {
    List<AccountStatModel> accountStatList = [];
    accountStatList.add(AccountStatModel(
        title: 'Followers',
        value: '100',
        // routeName: AppPages.followersList,
        routeName: AppPages.followersList,
        color: AppPalette.babyBlueLightBg));
    accountStatList.add(AccountStatModel(
        title: 'Following',
        value: '100',
        // routeName: AppPages.followingList,
        routeName: AppPages.followingList,
        color: AppPalette.violetLightBg));
    accountStatList.add(AccountStatModel(
        title: 'Vedios',
        value: '100',
        routeName: '/repos-list',
        color: AppPalette.peachLightBg));
    accountStatList.add(AccountStatModel(
        title: 'Likes',
        value: '100',
        routeName: '/gists-list',
        color: AppPalette.waterLightBg));

    return accountStatList;
  }
}
