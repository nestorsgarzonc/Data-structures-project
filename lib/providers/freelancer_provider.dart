import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import '../models/freelancer_model.dart';

class FreelancerProvider extends ChangeNotifier {
  List<FreelancerModel> _freelancerData = [];
  FreelancerModel _freelancerSelected = null;

  get freelancer => _freelancerSelected;

  set freelancer(freelancer) {
    _freelancerSelected = freelancer;
    notifyListeners();
  }

  List<FreelancerModel> get getFreelancers => _freelancerData;

  Future<void> loadData() async {
    final data = await rootBundle.loadString('assets/data/freelancer.json');
    _freelancerData = freelancerModelFromJson(data);
    print('Frelancer data loaded');
  }
}
