class WebtoonModel {
  late final String id;
  late final String title;
  late final String thumb;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        thumb = json['thumb'];

  // WebtoonModel(Map<String, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   thumb = json['thumb'];
  // }
}
