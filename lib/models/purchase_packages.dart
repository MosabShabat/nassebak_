class PurchasedPackages {
  int? id;
  String? title;
  String? price;
  String? currency;
  int? points;
  int? tickets;
  String? date;

  PurchasedPackages(
      {this.id,
      this.title,
      this.price,
      this.currency,
      this.points,
      this.tickets,
      this.date});

  PurchasedPackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    currency = json['currency'];
    points = json['points'];
    tickets = json['tickets'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['points'] = this.points;
    data['tickets'] = this.tickets;
    data['date'] = this.date;
    return data;
  }
}
