import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tikto_app/src/presentation/following_page/controller/following_page_controller.dart';

class FollowingListTailWidget extends StatelessWidget {
  const FollowingListTailWidget(
      {super.key, required this.followingPageController, required this.index});
  final FollowingPageController followingPageController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 10),
              spreadRadius: 1,
              blurRadius: 40,
            ),
          ]),
      child: ListTile(
          title: Text(
            followingPageController.userList[index].user.nickname,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/person.svg',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                        '${followingPageController.userList[index].stats.followingCount}'),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('Following'),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/heart.svg',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${followingPageController.userList[index].stats.heartCount}',
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('Likes'),
                  ],
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            foregroundColor: Colors.blue,
            backgroundImage: NetworkImage(
                followingPageController.userList[index].user.avatarThumb),
          ),
          onTap: () {
            // show image of user in dialog
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Image.network(
                          followingPageController.userList[index].user
                              .avatarLarger,
                          fit: BoxFit.cover,
                        ),
                );
              },
            );
          }),
    );
  }
}
