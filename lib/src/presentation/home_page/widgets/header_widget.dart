import 'package:flutter/material.dart';
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
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
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
        trailing: const Icon(Icons.notifications),
      ),
    );
  }
}
