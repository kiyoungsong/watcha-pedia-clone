class KeywordModel {
  final int id;
  final String name;
  const KeywordModel({required this.id, required this.name});

  factory KeywordModel.fromJson(Map<String, dynamic> json) {
    return KeywordModel(id: json["id"], name: json["name"]);
  }
}
