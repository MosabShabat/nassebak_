class Awards {
  int? id;
  String? image;
  String? title;
  int? points;

  Awards({this.id, this.image, this.title, this.points});

  Awards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['points'] = this.points;
    return data;
  }
}
