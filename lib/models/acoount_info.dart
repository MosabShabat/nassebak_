class AccountInfo {
  int? id;
  String? fullName;
  String? image;
  String? email;
  String? countryName;
  String? countryImage;
  String? cityName;
  String? mobileCountryCode;
  String? mobile;
  String? token;

  AccountInfo(
      {this.id,
      this.fullName,
      this.image,
      this.email,
      this.countryName,
      this.countryImage,
      this.cityName,
      this.mobileCountryCode,
      this.mobile,
      this.token});

  AccountInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    image = json['image'];
    email = json['email'];
    countryName = json['country_name'];
    countryImage = json['country_image'];
    cityName = json['city_name'];
    mobileCountryCode = json['mobile_country_code'];
    mobile = json['mobile'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['image'] = this.image;
    data['email'] = this.email;
    data['country_name'] = this.countryName;
    data['country_image'] = this.countryImage;
    data['city_name'] = this.cityName;
    data['mobile_country_code'] = this.mobileCountryCode;
    data['mobile'] = this.mobile;
    data['token'] = this.token;
    return data;
  }
}
