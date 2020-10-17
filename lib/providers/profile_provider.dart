import 'package:ed_project/collections/linked_list.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import './../models/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  LinkedList profilesData = LinkedList();
  ProfileModel _user = null;

  ProfileModel get getUser => _user;

  Future<void> loadData() async {
    final data = await rootBundle.loadString('assets/data/profile.json');
    profilesData = LinkedList.fromList(profileModelFromJson(data));
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
      profilesData.pushBack(
        ProfileModel(
          email: email,
          username: username,
          password: password,
          lastTransactions: [],
          avatarUrl:
              'https://images.unsplash.com/photo-1602696221981-75511960e2b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
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
      profilesData.pushBack(user);
      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
