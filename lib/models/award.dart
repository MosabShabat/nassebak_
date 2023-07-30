class Award {
  int? id;
  String? image;
  String? title;
  int? points;
  int? quantity;
  String? description;
  String? expiryDate;

  Award(
      {this.id,
      this.image,
      this.title,
      this.points,
      this.quantity,
      this.description,
      this.expiryDate});

  Award.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    points = json['points'];
    quantity = json['quantity'];
    description = json['description'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['points'] = this.points;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    data['expiry_date'] = this.expiryDate;
    return data;
  }
}
