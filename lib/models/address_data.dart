class AddressData {
  String? title;
  String? homeNumber;
  String? description;
  int? countryId;
  int? cityId;
  String? zipCode;

  AddressData(
      {this.title,
      this.homeNumber,
      this.description,
      this.countryId,
      this.cityId,
      this.zipCode});

  AddressData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    homeNumber = json['home_number'];
    description = json['description'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['home_number'] = this.homeNumber;
    data['description'] = this.description;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['zip_code'] = this.zipCode;
    return data;
  }
}
