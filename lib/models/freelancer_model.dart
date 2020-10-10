import 'dart:convert';

List<LessonsModel> lessonsModelFromJson(String str) => List<LessonsModel>.from(
    json.decode(str).map((x) => LessonsModel.fromJson(x)));

String lessonsModelToJson(List<LessonsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonsModel {
  LessonsModel({
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
  String gender;
  String avatarUrl;
  List<Service> services;

  factory LessonsModel.fromJson(Map<String, dynamic> json) => LessonsModel(
        name: json["name"],
        lastName: json["last_name"],
        username: json["username"],
        location: json["location"],
        gender: json["gender"],
        avatarUrl: json["avatar_url"],
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "username": username,
        "location": location,
        "gender": gender,
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
        serviceName: json["service_name"],
        date: DateTime.parse(json["date"]),
        category: json["category"],
        imageUrl: json["image_url"],
        numberStars: json["numberStars"],
        price: json["price"],
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
