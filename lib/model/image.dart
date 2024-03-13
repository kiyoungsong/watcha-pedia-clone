class ImageModel {
  final String filePath;

  const ImageModel({required this.filePath});

  static List<ImageModel> fromJson(List<dynamic> jsonList) {
    final result =
        jsonList.map((e) => ImageModel(filePath: e["file_path"])).toList();

    return result;
  }
}
