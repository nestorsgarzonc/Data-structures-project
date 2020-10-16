import 'package:ed_project/providers/freelancer_provider.dart';
import 'package:ed_project/widgets/appbar_with_backbutton_widget.dart';
import 'package:ed_project/widgets/task_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksListPage extends StatelessWidget {
  static const route = 'tasks_list_page';

  @override
  Widget build(BuildContext context) {
    final freelaProv = Provider.of<FreelancerProvider>(context).getFreelancers;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const AppBarWithBackButtonWidget(text: 'Tareas populares'),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: freelaProv.length,
                itemBuilder: (context, i) => TaskCard(
                  freelancer: freelaProv[i],
                  service: freelaProv[i].services[0],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
