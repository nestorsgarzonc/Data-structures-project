import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import '../models/freelancer_model.dart';

class FreelancerProvider extends ChangeNotifier {
  List<FreelancerModel> freelancerData = [];

  Future<void> loadData() async {
    final data = await rootBundle.loadString('assets/data/freelancer.json');
    freelancerData = freelancerModelFromJson(data);
    print('Frelancer data loaded');
  }
}
