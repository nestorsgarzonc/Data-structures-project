// ignore: constant_identifier_names
enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    // ignore: join_return_with_assignment
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
