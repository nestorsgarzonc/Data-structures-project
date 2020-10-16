import 'package:ed_project/models/freelancer_model.dart';
import 'package:ed_project/widgets/background_image_rounded.dart';
import 'package:ed_project/widgets/task_card_widget.dart';
import 'package:flutter/material.dart';

class FreelancerProfilePage extends StatelessWidget {
  static const String route = 'FreelancerProfilePage';
  @override
  Widget build(BuildContext context) {
    final FreelancerModel freel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Column(
        children: [
          _HeaderCardProfile(freel: freel),
          Expanded(
            child: ListView.builder(
              itemCount: freel.services.length,
              itemBuilder: (context, i) => TaskCard(
                freelancer: freel,
                service: freel.services[i],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderCardProfile extends StatelessWidget {
  const _HeaderCardProfile({Key key, @required this.freel}) : super(key: key);

  final FreelancerModel freel;

  @override
  Widget build(BuildContext context) {
    return BackgroundImageRoundedWidget(
      imgRoute: 'assets/img/freelancer_background.jpg',
      percentHigh: 0.42,
      opacity: 0.3,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CircleAvatar(
            backgroundImage: NetworkImage(freel.avatarUrl),
            radius: 60,
          ),
          const SizedBox(height: 10),
          Text(
            freel.name,
            style: const TextStyle(color: Colors.white, fontSize: 28),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                freel.location,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ButtonHeaderCard(
                icon: Icons.message,
                onTap: () {},
                text: 'Mensaje',
              ),
              const SizedBox(width: 10),
              _ButtonHeaderCard(
                icon: Icons.call,
                onTap: () {},
                text: 'Contactame',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonHeaderCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;
  const _ButtonHeaderCard({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue[700]),
            const SizedBox(width: 10),
            Container(
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
