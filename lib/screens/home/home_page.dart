import 'dart:math';
import 'package:ed_project/providers/freelancer_provider.dart';
import 'package:ed_project/providers/profile_provider.dart';
import 'package:ed_project/screens/freelancers/freelancer_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../screens/categories/categories_list.dart';
import '../../screens/tasks/task_description.dart';
import '../../screens/tasks/tasks_list.dart';
import '../../widgets/categories_card_widget.dart';
import '../../widgets/freelancer_miniphoto_widget.dart';
import '../../widgets/popular_task_card_widget.dart';
import '../../widgets/title_categories_widget.dart';
import '../home/search_page.dart';
import '../profile/user_profile_page.dart';

class HomePage extends StatelessWidget {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    final freelaProv = Provider.of<FreelancerProvider>(context).getFreelancers;
    return Scaffold(
      body: Column(
        children: [
          const _CustomAppBar(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                const CustomSearchButton(),
                const SizedBox(height: 20),
                TitleCategoriesWidget(
                  title: 'Categorias',
                  onPress: () =>
                      Navigator.of(context).pushNamed(CategoriesListPage.route),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) => PopularTaskWidget(
                      onTap: () {},
                      text: 'Item #$index',
                      color: Color.fromRGBO(
                        random.nextInt(255),
                        random.nextInt(255),
                        random.nextInt(255),
                        1,
                      ),
                    ),
                  ),
                ),
                TitleCategoriesWidget(
                  title: 'Tareas populares',
                  onPress: () =>
                      Navigator.of(context).pushNamed(TasksListPage.route),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: freelaProv.length,
                    itemBuilder: (context, i) => CategoriesWidget(
                      frelancersCounter: 20,
                      isExternal: true,
                      imageUrl: freelaProv[i].services[0].imageUrl,
                      name: freelaProv[i].services[0].serviceName,
                      onTap: () =>
                          Navigator.of(context).pushNamed(TaskPage.route),
                    ),
                  ),
                ),
                TitleCategoriesWidget(title: 'Freelancers', onPress: () {}),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: freelaProv.length,
                    itemBuilder: (context, i) => FreelancerMiniPhotoWidget(
                      freelancerName: freelaProv[i].name,
                      freelancerUrlImage: freelaProv[i].avatarUrl,
                      onTap: () => Navigator.of(context).pushNamed(
                          FreelancerProfilePage.route,
                          arguments: freelaProv[i]),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(SearchPage.route),
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 5, right: 7),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(2, 3),
              color: Colors.grey,
            )
          ],
        ),
        child: Row(
          children: const [Icon(Icons.search), Text('   ¿Que necesitas?')],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProviderView = Provider.of<ProfileProvider>(context).getUser;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(UserProfilePage.route),
          child: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(userProviderView.avatarUrl)),
        ),
      ],
    );
  }
}
