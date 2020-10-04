import 'package:flutter/material.dart';

import '../screens/authentication/login_page.dart';
import '../screens/authentication/register_page.dart';
import '../screens/home/main_page.dart';
import '../screens/home/search_page.dart';
import '../screens/initial_page.dart';
import '../screens/profile/user_profile_page.dart';

final Map<String, Widget Function(BuildContext)> constRoutes = {
  InitialPage.route: (ctx) => InitialPage(),
  RegisterPage.route: (ctx) => RegisterPage(),
  LoginPage.route: (ctx) => LoginPage(),
  MainPage.route: (ctx) => MainPage(),
  SearchPage.route: (ctx) => SearchPage(),
  UserProfilePage.route: (ctx) => UserProfilePage(),
};
