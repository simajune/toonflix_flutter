class WebtoonDetailModel {
  late final String title;
  late final String about;
  late final String genre;
  late final String age;
  late final String thumb;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'],
        thumb = json['thumb'];
}
