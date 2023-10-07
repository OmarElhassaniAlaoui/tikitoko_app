import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/routes/app_pages.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/app/themes/app_palette.dart';
import 'package:tikto_app/src/presentation/home_page/controller/user_state_controller.dart';

class AccountStatModel  {
  final String title;
  final int value;
  final String routeName;
  final Color? color;
  final String icon;
  static LocalStorageService service = Get.find<LocalStorageService>();
  static UserStateController userStateController = Get.find<UserStateController>();
  AccountStatModel(
      {required this.title,
      required this.value,
      required this.routeName,
      required this.icon,
      this.color});

  static List<AccountStatModel> getAccountStatus() {
    List<AccountStatModel> accountStatList = [];
    accountStatList.add(AccountStatModel(
        title: 'Followers',
        // value: service.sharedPreferences.getInt("followerCount") ?? 0, 
        value: userStateController.userStateList[0].followerCount,
        routeName: AppPages.followersList,
        color: AppPalette.babyBlueLightBg, 
        icon: 'assets/icons/person.svg',
        ));
    accountStatList.add(AccountStatModel(
        title: 'Following',
        // value: service.sharedPreferences.getInt("followingCount") ?? 0,
        value: userStateController.userStateList[0].followingCount,
        // routeName: AppPages.followingList,
        routeName: AppPages.followingList,
        color: AppPalette.violetLightBg , 
        icon: 'assets/icons/person.svg',
        ));
    accountStatList.add(AccountStatModel(
        title: 'Vedios',
        // value:  service.sharedPreferences.getInt("videoCount") ?? 0, 
        value: userStateController.userStateList[0].videoCount,
        routeName: '/repos-list',
        color: AppPalette.peachLightBg,  
        icon: 'assets/icons/vedio.svg',
        
        ));
    accountStatList.add(AccountStatModel(
        title: 'Likes',
        // value:  service.sharedPreferences.getInt("heartCount") ?? 0,
        value: userStateController.userStateList[0].heartCount,
        routeName: '/gists-list',
        color: AppPalette.waterLightBg,
        icon: 'assets/icons/heart.svg',
        ));

    return accountStatList;
  }
}
