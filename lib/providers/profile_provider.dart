import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import './../models/profile_model.dart';

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

  bool singUp(String email, String username, String password) {
    try {
      profilesData.firstWhere((e) => e.email == email);
      return false;
    } catch (e) {
      profilesData.add(
        ProfileModel(
          email: email,
          username: username,
          password: password,
          lastTransactions: [],
          avatarUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Logotipo_de_la_Universidad_Nacional_de_Colombia.svg/1200px-Logotipo_de_la_Universidad_Nacional_de_Colombia.svg.png',
          gender: Gender.MALE,
          lastName: '',
          location: '',
          name: '',
        ),
      );
      return true;
    }
  }

  bool deleteUser() {
    if (_user == null) {
      return false;
    }
    try {
      profilesData.removeWhere((element) => element == _user);
      _user = null;
      //notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  bool updateUser(ProfileModel user) {
    if (_user == null || user == null) {
      return false;
    }
    try {
      profilesData.removeWhere((element) => element == _user);
      profilesData.add(user);
      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
