import 'package:flutter/material.dart';

class FollersListTailWidget extends StatelessWidget {
  const FollersListTailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
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
              title: const Text('Follower 1'),
              subtitle: const Text('Follower 1 description'),
              leading: const CircleAvatar(
                foregroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/250?image=9',
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {}),
        ),
      ],
    );
  }
}