// data_model.dart
class MyData {
  int userId;
  int id;
  String title;
  String body;

  MyData(this.userId, this.id, this.title, this.body);

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      json['userId'],
      json['id'],
      json['title'],
      json['body'],
    );
  }
}
