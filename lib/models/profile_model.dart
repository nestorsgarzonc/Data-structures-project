// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(
    json.decode(str).map((x) => ProfileModel.fromJson(x)));

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
    this.avatarUrl,
    this.lastTransactions,
  });

  String name;
  String lastName;
  String username;
  String email;
  String password;
  String location;
  Gender gender;
  String avatarUrl;
  List<LastTransaction> lastTransactions;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json["name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        location: json["location"],
        gender: genderValues.map[json["gender"]],
        avatarUrl: json["avatar_url"],
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
        "avatar_url": avatarUrl,
        "last_transactions":
            List<dynamic>.from(lastTransactions.map((x) => x.toJson())),
      };
}

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

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

  factory LastTransaction.fromJson(Map<String, dynamic> json) =>
      LastTransaction(
        freelancer: json["freelancer"],
        serviceName: json["service_name"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        category: json["category"],
        price: json["price"],
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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
