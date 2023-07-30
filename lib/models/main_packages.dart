class Mainpackages {
  List<Packages>? packages;
  int? tickets;

  Mainpackages({this.packages, this.tickets});

  Mainpackages.fromJson(Map<String, dynamic> json) {
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
    tickets = json['tickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    data['tickets'] = this.tickets;
    return data;
  }
}

class Packages {
  int? id;
  String? title;
  String? price;
  String? currency;
  int? points;
  int? tickets;

  Packages(
      {this.id,
      this.title,
      this.price,
      this.currency,
      this.points,
      this.tickets});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    currency = json['currency'];
    points = json['points'];
    tickets = json['tickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['points'] = this.points;
    data['tickets'] = this.tickets;
    return data;
  }
}
