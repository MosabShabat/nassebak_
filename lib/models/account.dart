class User {
  int? id;
  String? fullName;
  String? image;
  int? tickets;
  int? points;
  String? token;

  User({
    this.id,
    this.fullName,
    this.image,
    this.tickets,
    this.points,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      image: json['image'],
      tickets: json['tickets'],
      points: json['points'],
      token: json['token'],
    );
  }
}

class SocialMediaData {
  String? uuid;
  String? icon;
  String? link;

  SocialMediaData({
    this.uuid,
    this.icon,
    this.link,
  });

  factory SocialMediaData.fromJson(Map<String, dynamic> json) {
    return SocialMediaData(
      uuid: json['uuid'],
      icon: json['icon'],
      link: json['link'],
    );
  }
}
