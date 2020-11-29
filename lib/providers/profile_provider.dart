import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import '../collections/linked_list.dart';
import '../models/freelancer_model.dart' as freelancer;
import './../models/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  LinkedList profilesData = LinkedList();
  ProfileModel _user;

  ProfileModel get getUser => _user;
  freelancer.Service _selectedService;
  freelancer.FreelancerModel _selectedFreelancer;

  freelancer.Service get getSelectedService => _selectedService;
  freelancer.FreelancerModel get getSelectedFreelancer => _selectedFreelancer;

  void setSelectedService(freelancer.Service selectedService) {
    _selectedService = selectedService;
    notifyListeners();
  }

  void setSelectedFreelancer(freelancer.FreelancerModel selectedFreelancer) {
    _selectedFreelancer = selectedFreelancer;
    notifyListeners();
  }

  void setUserToFreelancer() {
    _user.isFreelancer = true;
    notifyListeners();
  }

  bool isFreelancer() => _user.isFreelancer;

  void addNewService(String fName, String serviceName, String categoria, int price) {
    _user.lastTransactions.add(LastTransaction(
      category: categoria,
      date: DateTime.now(),
      description: 'Lorem',
      freelancer: fName,
      price: price,
      serviceName: serviceName,
    ));
    notifyListeners();
  }

  Future<void> loadData() async {
    if (!profilesData.isEmpty()) {
      return;
    }
    final data = await rootBundle.loadString('assets/data/profile.json');
    profilesData = LinkedList.fromList(profileModelFromJson(data));
    print('Profile data loaded');
  }

  bool login(String email, String password) {
    try {
      _user = profilesData.firstWhere(
        (e) => e.email == email && e.password == password,
      ) as ProfileModel;
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
              'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1276&q=80',
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
