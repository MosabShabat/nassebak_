class DealsDetails {
  int? id;
  int? status;
  String? title;
  String? image;
  bool? isFavorite;
  int? tickets;
  int? remainingTime;
  String? initialPrice;
  String? currency;
  List<String>? images;
  int? points;
  String? originalPrice;
  String? description;
  String? info;

  DealsDetails(
      {this.id,
      this.status,
      this.title,
      this.image,
      this.isFavorite,
      this.tickets,
      this.remainingTime,
      this.initialPrice,
      this.currency,
      this.images,
      this.points,
      this.originalPrice,
      this.description,
      this.info});

  DealsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    title = json['title'];
    image = json['image'];
    isFavorite = json['is_favorite'];
    tickets = json['tickets'];
    remainingTime = json['remaining_time'];
    initialPrice = json['initial_price'];
    currency = json['currency'];
    images = json['images'].cast<String>();
    points = json['points'];
    originalPrice = json['original_price'];
    description = json['description'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['title'] = this.title;
    data['image'] = this.image;
    data['is_favorite'] = this.isFavorite;
    data['tickets'] = this.tickets;
    data['remaining_time'] = this.remainingTime;
    data['initial_price'] = this.initialPrice;
    data['currency'] = this.currency;
    data['images'] = this.images;
    data['points'] = this.points;
    data['original_price'] = this.originalPrice;
    data['description'] = this.description;
    data['info'] = this.info;
    return data;
  }
}
