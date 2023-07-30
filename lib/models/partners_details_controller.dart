class partnersDetails {
  int? id;
  String? logo;
  String? name;
  String? description;
  List<String>? images;
  String? title;
  String? value;
  String? details;
  String? link;
  String? expiryDate;

  partnersDetails(
      {this.id,
      this.logo,
      this.name,
      this.description,
      this.images,
      this.title,
      this.value,
      this.details,
      this.link,
      this.expiryDate});

  partnersDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    title = json['title'];
    value = json['value'];
    details = json['details'];
    link = json['link'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['name'] = this.name;
    data['description'] = this.description;
    data['images'] = this.images;
    data['title'] = this.title;
    data['value'] = this.value;
    data['details'] = this.details;
    data['link'] = this.link;
    data['expiry_date'] = this.expiryDate;
    return data;
  }
}
