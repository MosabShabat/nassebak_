
class Package {
  int? id;
  String? title;
  String? price;
  String? currency;
  int? points;
  int? tickets;

  Package(
      {this.id,
      this.title,
      this.price,
      this.currency,
      this.points,
      this.tickets});

  Package.fromJson(Map<String, dynamic> json) {
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

class PromoCode {
  bool? exists;
  String? code;

  PromoCode({this.exists, this.code});

  PromoCode.fromJson(Map<String, dynamic> json) {
    exists = json['exists'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exists'] = this.exists;
    data['code'] = this.code;
    return data;
  }
}

class Bill {
  String? price;
  String? promoCodeAmount;
  String? vat;
  String? total;
  String? currency;

  Bill({this.price, this.promoCodeAmount, this.vat, this.total, this.currency});

  Bill.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    promoCodeAmount = json['promo_code_amount'];
    vat = json['vat'];
    total = json['total'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['promo_code_amount'] = this.promoCodeAmount;
    data['vat'] = this.vat;
    data['total'] = this.total;
    data['currency'] = this.currency;
    return data;
  }
}

class PaymentMethods {
  int? id;
  String? image;
  String? brandName;

  PaymentMethods({this.id, this.image, this.brandName});

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    brandName = json['brand_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['brand_name'] = this.brandName;
    return data;
  }
}
