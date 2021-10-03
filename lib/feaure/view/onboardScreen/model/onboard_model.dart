class Onboard {
  int? id;
  String? title;
  String? body;
  String? image;
  String? imageHash;

  Onboard({this.id, this.title, this.body, this.image, this.imageHash});

  Onboard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    imageHash = json['imageHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['image'] = image;
    data['imageHash'] = imageHash;
    return data;
  }
}
