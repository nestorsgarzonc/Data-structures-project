import 'package:ed_project/models/profile_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  var profileData = [];
  Future<void> chargeData() async {
    final data = await rootBundle.loadString('assets/data/profile.json');
    profileData = profileModelFromJson(data);
    print(profileData);
  }
}
