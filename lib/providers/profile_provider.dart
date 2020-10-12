import 'package:ed_project/models/profile_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  List<ProfileModel> profileData = [];
  ProfileModel _user = null;

  ProfileModel get getUser => _user;

  Future<void> loadData() async {
    final data = await rootBundle.loadString('assets/data/profile.json');
    profileData = profileModelFromJson(data);
    print('Profile data loaded');
  }

  bool login(String email, String password) {
    try {
      _user = profileData.firstWhere(
        (e) => e.email == email && e.password == password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
