import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/freelancer_provider.dart';
import '../../widgets/appbar_with_backbutton_widget.dart';
import '../../widgets/task_card_widget.dart';

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
