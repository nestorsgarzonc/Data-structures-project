import 'package:flutter/material.dart';
import '../screens/authentication/login_page.dart';
import '../screens/authentication/register_page.dart';
import '../screens/categories/categories_list.dart';
import '../screens/freelancers/freelancer_profile_page.dart';
import '../screens/home/main_page.dart';
import '../screens/home/search_page.dart';
import '../screens/initial_page.dart';
import '../screens/payment/payment.dart';
import '../screens/profile/edit_profile_page.dart';
import '../screens/profile/user_profile_page.dart';
import '../screens/tasks/task_description.dart';
import '../screens/tasks/tasks_list.dart';

final Map<String, Widget Function(BuildContext)> constRoutes = {
  InitialPage.route: (ctx) => InitialPage(),
  RegisterPage.route: (ctx) => RegisterPage(),
  LoginPage.route: (ctx) => LoginPage(),
  MainPage.route: (ctx) => MainPage(),
  SearchPage.route: (ctx) => SearchPage(),
  UserProfilePage.route: (ctx) => UserProfilePage(),
  TasksListPage.route: (ctx) => TasksListPage(),
  TaskPage.route: (ctx) => TaskPage(),
  PaymentPage.route: (ctx) => PaymentPage(),
  CategoriesListPage.route: (ctx) => CategoriesListPage(),
  EditProfilePage.route: (ctx) => EditProfilePage(),
  FreelancerProfilePage.route: (ctx) => FreelancerProfilePage(),
};
