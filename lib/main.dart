import 'package:flutter/material.dart';
import 'package:tikto_app/src/presentation/search_user/pages/search_user_page.dart';
import 'package:tikto_app/src/tikto_app.dart';

void main() {
  runApp(const TiktoApp());
}
class TiktoApp extends StatelessWidget {
  const TiktoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SearchUserPage(), 
    );
  }
}   

