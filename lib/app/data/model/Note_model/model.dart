class NoteModel {
  int? id;
  String? title;
  String? body;
  String? time;

  NoteModel({this.id, this.title, this.body, this.time});

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['time'] = this.time;
    return data;
  }
}
