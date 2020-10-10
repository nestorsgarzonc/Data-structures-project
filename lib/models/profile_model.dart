// To parse this JSON data, do
//
//     final lessonsModel = lessonsModelFromJson(jsonString);

import 'dart:convert';

List<LessonsModel> lessonsModelFromJson(String str) => List<LessonsModel>.from(json.decode(str).map((x) => LessonsModel.fromJson(x)));

String lessonsModelToJson(List<LessonsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonsModel {
    LessonsModel({
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
    String gender;
    String avatarUrl;
    List<LastTransaction> lastTransactions;

    factory LessonsModel.fromJson(Map<String, dynamic> json) => LessonsModel(
        name: json["name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        location: json["location"],
        gender: json["gender"],
        avatarUrl: json["avatar_url"],
        lastTransactions: List<LastTransaction>.from(json["last_transactions"].map((x) => LastTransaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": lastName,
        "username": username,
        "email": email,
        "password": password,
        "location": location,
        "gender": gender,
        "avatar_url": avatarUrl,
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
