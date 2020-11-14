import 'package:flutter/material.dart';
import '../../widgets/appbar_with_backbutton_widget.dart';

class BeAFreelancerPage extends StatelessWidget {
  static const String route = 'BeAFreelancerPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const AppBarWithBackButtonWidget(text: 'Ser freelancer'),
            Expanded(
              child: ListView(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
