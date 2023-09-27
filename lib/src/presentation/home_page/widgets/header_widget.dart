import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final service = Get.put(LocalStorageService());
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
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "${service.sharedPreferences.getString("avatarThumb")}"),
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
              // Get.toNamed('/notification');
            },
            child: SvgPicture.asset(
              'assets/icons/notif.svg',
              height: 40,
              width: 40,
            ),
          )),
    );
  }
}
