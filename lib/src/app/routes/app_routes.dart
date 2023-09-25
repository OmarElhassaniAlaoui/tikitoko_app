import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/pages/home._page.dart';
import 'package:tikto_app/src/presentation/search_user/pages/search_user_page.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: '/search-tiktok-user',
    page: () =>  SearchUserPage(),
  ),
  GetPage(
    name: '/homePage',
    page: () =>const HomePage(),
  ), 

 
];