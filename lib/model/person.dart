class PersonModel {
  final String name;
  final String biography;
  final String department;
  final String profilePath;

  const PersonModel(
      {required this.name,
      required this.biography,
      required this.department,
      required this.profilePath});

  static PersonModel fromJson(dynamic json) {
    final result = PersonModel(
        name: json["name"],
        biography: json["biography"],
        department: json["known_for_department"],
        profilePath: json["profile_path"]);
    return result;
  }
}
