import 'package:flutter/material.dart';
import 'package:tikto_app/src/presentation/following_page/widgets/following_list_tail.dart';

class FollwingListPage extends StatelessWidget {
  const FollwingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Following List'),
        ),
        body: const FollowingListTailWidget() , 
      ),
    );
  }
}