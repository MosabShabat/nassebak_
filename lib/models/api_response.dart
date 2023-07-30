class Intro {
  int? id;
  String? image;
  String? title;
  String? description;

  Intro({
    this.id,
    this.image,
    this.title,
    this.description,
  });

  Intro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
