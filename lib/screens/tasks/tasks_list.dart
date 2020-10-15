import 'package:ed_project/models/freelancer_model.dart';
import 'package:ed_project/providers/freelancer_provider.dart';
import 'package:ed_project/widgets/appbar_with_backbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './task_description.dart';

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
                itemBuilder: (context, i) => _TaskCard(
                  freelancer: freelaProv[i],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final FreelancerModel freelancer;
  _TaskCard({Key key, this.freelancer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = freelancer.services[0];

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(TaskPage.route),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.grey)],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(service.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        height: 350,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: 140,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: _BottomContentTaskCard(freelancerInfo: freelancer),
              ),
            ),
            const Positioned(
              bottom: 120,
              right: 40,
              child: _HeartIcon(),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: _LocationWIdget(location: freelancer.location),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationWIdget extends StatelessWidget {
  final String location;
  _LocationWIdget({Key key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.grey)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [Icon(Icons.location_on), Text(location)]),
    );
  }
}

class _HeartIcon extends StatefulWidget {
  const _HeartIcon({Key key}) : super(key: key);

  @override
  __HeartIconState createState() => __HeartIconState();
}

class __HeartIconState extends State<_HeartIcon> {
  bool _isTouched = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => _isTouched = !_isTouched),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          color: Colors.white,
          boxShadow: const [BoxShadow(blurRadius: 1, color: Colors.grey)],
        ),
        child: Icon(
          _isTouched ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
    );
  }
}

class _BottomContentTaskCard extends StatelessWidget {
  final FreelancerModel freelancerInfo;
  _BottomContentTaskCard({Key key, @required this.freelancerInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = freelancerInfo.services[0];
    final filledStars = List.generate(service.numberStars,
        (_) => Icon(Icons.star, color: Theme.of(context).primaryColor));
    final outlineStars = List.generate((5 - service.numberStars).abs(),
        (_) => Icon(Icons.star_border, color: Theme.of(context).primaryColor));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                service.serviceName,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(freelancerInfo.avatarUrl),
                  ),
                  Text(
                    '  ${freelancerInfo.name}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  ...filledStars,
                  ...outlineStars,
                  const Text(
                    '  29 reseñas',
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
            ]),
        Text(
          '\$${service.price}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
