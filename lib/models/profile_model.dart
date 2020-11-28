// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

import 'gender_model.dart';
export 'gender_model.dart';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(
      json.decode(str).map((x) => ProfileModel.fromJson(x)),
    );

String profileModelToJson(List<ProfileModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileModel {
  ProfileModel({
    this.name,
    this.lastName,
    this.username,
    this.email,
    this.password,
    this.location,
    this.gender,
    this.isFreelancer,
    this.avatarUrl,
    this.freelancerId,
    this.lastTransactions,
  });

  String name;
  String lastName;
  String username;
  String email;
  String password;
  String location;
  Gender gender;
  bool isFreelancer;
  String avatarUrl;
  int freelancerId;
  List<LastTransaction> lastTransactions;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"] as String,
        lastName: json["last_name"] as String,
        username: json["username"] as String,
        email: json["email"] as String,
        password: json["password"] as String,
        location: json["location"] as String,
        gender: genderValues.map[json["gender"]] as Gender,
        isFreelancer: json["is_freelancer"] == null ? null : json["is_freelancer"] as bool,
        avatarUrl: json["avatar_url"] as String,
        freelancerId: json["freelancer_id"] == null ? null : json["freelancer_id"] as int,
        lastTransactions: List<LastTransaction>.from(
            json["last_transactions"].map((x) => LastTransaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "username": username,
        "email": email,
        "password": password,
        "location": location,
        "gender": genderValues.reverse[gender],
        "is_freelancer": isFreelancer,
        "avatar_url": avatarUrl,
        "freelancer_id": freelancerId,
        "last_transactions": List<dynamic>.from(lastTransactions.map((x) => x.toJson())),
      };
}

class LastTransaction {
  LastTransaction({
    this.freelancer,
    this.serviceName,
    this.description,
    this.date,
    this.category,
    this.price,
  });

  String freelancer;
  String serviceName;
  String description;
  DateTime date;
  String category;
  int price;

  factory LastTransaction.fromJson(Map<String, dynamic> json) => LastTransaction(
        freelancer: json["freelancer"] as String,
        serviceName: json["service_name"] as String,
        description: json["description"] as String,
        date: DateTime.parse(json["date"] as String),
        category: json["category"] as String,
        price: json["price"] as int,
      );

  Map<String, dynamic> toJson() => {
        "freelancer": freelancer,
        "service_name": serviceName,
        "description": description,
        "date": date.toIso8601String(),
        "category": category,
        "price": price,
      };
}
