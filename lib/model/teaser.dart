class TeaserModel {
  final String id;
  final String type;
  final String key;

  const TeaserModel({required this.id, required this.type, required this.key});
  static List<TeaserModel> formJson(List<dynamic> jsonList) {
    final result = jsonList
        .map((e) => TeaserModel(id: e["id"], type: e["type"], key: e["key"]))
        .toList();
    return result;
  }
}
