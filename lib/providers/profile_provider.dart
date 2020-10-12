import 'package:ed_project/models/profile_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  List<ProfileModel> profilesData = [];
  ProfileModel _user = null;

  ProfileModel get getUser => _user;

  Future<void> loadData() async {
    final data = await rootBundle.loadString('assets/data/profile.json');
    profilesData = profileModelFromJson(data);
    print('Profile data loaded');
  }

  bool login(String email, String password) {
    try {
      _user = profilesData.firstWhere(
        (e) => e.email == email && e.password == password,
      );
      return true;
    } catch (e) {
      _user = null;
      return false;
    }
  }
}
