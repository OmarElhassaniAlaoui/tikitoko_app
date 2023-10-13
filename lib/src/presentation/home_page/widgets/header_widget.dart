import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/presentation/home_page/controller/home_page_controller.dart';

class HeaderWidget extends GetWidget<HomeController> {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final service = Get.put(LocalStorageService());
    final controller = Get.put(HomeController());
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      "${service.sharedPreferences.getString("avatarThumb")}",
                      fit: BoxFit.cover, errorBuilder: (BuildContext context,
                          Object exception, StackTrace? stackTrace) {
                    return const Icon(Icons.person);
                  }),
                ),
              ),
            ),
          ),
          title: Text(
            '${service.sharedPreferences.getString("username")}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          trailing: InkWell(
            onTap: () {
              controller.logOut();
            },
            child: SvgPicture.asset(
              'assets/icons/logout.svg',
              height: 40,
              width: 40,
            ),
          )),
    );
  }
}
