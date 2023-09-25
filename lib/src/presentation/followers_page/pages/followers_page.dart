import 'package:flutter/material.dart';
import 'package:tikto_app/src/presentation/followers_page/widgets/followers_list_tail_widget.dart';

class FollwersListPage extends StatelessWidget {
  const FollwersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Followers List'),
        ),
        body: const FollersListTailWidget(),
      ),
    );
  }
}