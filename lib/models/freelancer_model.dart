// To parse this JSON data, do
//
//     final freelancerModel = freelancerModelFromJson(jsonString);

import 'dart:convert';

List<FreelancerModel> freelancerModelFromJson(String str) => List<FreelancerModel>.from(json.decode(str).map((x) => FreelancerModel.fromJson(x)));

String freelancerModelToJson(List<FreelancerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
        name: json["name"],
        lastName: json["last_name"],
        username: json["username"],
        location: json["location"],
        gender: genderValues.map[json["gender"]],
        avatarUrl: json["avatar_url"],
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
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

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({
    "female": Gender.FEMALE,
    "male": Gender.MALE
});

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
