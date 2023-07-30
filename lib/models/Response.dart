
class Response<T> {
  bool? status;
  String? message;
  bool? isUpdateAvailable;
  T? data; 
  T? pages;

  Response({
    this.status,
    this.message,
    this.isUpdateAvailable,
    required this.data, 
    this.pages,
  });

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    isUpdateAvailable = json['is_update_available'];
    data = json['data'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['is_update_available'] = isUpdateAvailable;
    data['data'] = data;
    data['pages'] = pages;

    return data;
  }
}
