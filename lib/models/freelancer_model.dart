// To parse this JSON data, do
//
//     final freelancerModel = freelancerModelFromJson(jsonString);

import 'dart:convert';

import 'gender_model.dart';
export 'gender_model.dart';

List<FreelancerModel> freelancerModelFromJson(String str) => List<FreelancerModel>.from(
    json.decode(str).map((x) => FreelancerModel.fromJson(x)) as Iterable);

String freelancerModelToJson(List<FreelancerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FreelancerModel {
  FreelancerModel({
    this.name,
    this.lastName,
    this.username,
    this.location,
    this.gender,
    this.avatarUrl,
    this.services,
  });

  String name;
  String lastName;
  String username;
  String location;
  Gender gender;
  String avatarUrl;
  List<Service> services;

  factory FreelancerModel.fromJson(Map<String, dynamic> json) => FreelancerModel(
        name: json["name"] as String,
        lastName: json["last_name"] as String,
        username: json["username"] as String,
        location: json["location"] as String,
        gender: genderValues.map[json["gender"]],
        avatarUrl: json["avatar_url"] as String,
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x)) as Iterable),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "username": username,
        "location": location,
        "gender": genderValues.reverse[gender],
        "avatar_url": avatarUrl,
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
      };
}

class Service {
  Service({
    this.serviceName,
    this.date,
    this.category,
    this.imageUrl,
    this.numberStars,
    this.price,
  });

  String serviceName;
  DateTime date;
  String category;
  String imageUrl;
  int numberStars;
  int price;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceName: json["service_name"] as String,
        date: DateTime.parse(json["date"] as String),
        category: json["category"] as String,
        imageUrl: json["image_url"] as String,
        numberStars: json["numberStars"] as int,
        price: json["price"] as int,
      );

  Map<String, dynamic> toJson() => {
        "service_name": serviceName,
        "date": date.toIso8601String(),
        "category": category,
        "image_url": imageUrl,
        "numberStars": numberStars,
        "price": price,
      };
}
