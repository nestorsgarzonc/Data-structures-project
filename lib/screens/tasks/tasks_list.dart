import 'package:flutter/material.dart';
import './task_description.dart';

class TasksListPage extends StatelessWidget {
  static const route = 'tasks_list_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back_ios),
                ),
                const Text(
                  'Tareas populares',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 25,
                itemBuilder: (context, index) => _TaskCard(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final borderStars = List.generate(
    1,
    (index) => const Icon(Icons.star_border),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(TaskPage.route),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 2, color: Colors.grey),
          ],
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage('assets/img/task_list_wallpaper.jpg'),
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
                child: const _BottomContentTaskCard(),
              ),
            ),
            const Positioned(
              bottom: 120,
              right: 40,
              child: _HeartIcon(),
            ),
            const Positioned(
              top: 20,
              left: 20,
              child: _LocationWIdget(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationWIdget extends StatelessWidget {
  const _LocationWIdget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.grey)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Icon(Icons.location_on),
          Text('Bogota, Colombia'),
        ],
      ),
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
  const _BottomContentTaskCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filledStars = List.generate(
        4, (_) => Icon(Icons.star, color: Theme.of(context).primaryColor));
    final outlineStars = List.generate(1,
        (_) => Icon(Icons.star_border, color: Theme.of(context).primaryColor));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Limpieza general hogar',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Row(
                children: const [
                  CircleAvatar(child: Text('JT')),
                  Text('  Jose Torres', style: TextStyle(fontSize: 16)),
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
        const Text(
          '\$20.000',
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
