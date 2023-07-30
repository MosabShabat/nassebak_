class InterItem {
  int? id;
  String? title;
  bool? isSelected;

  InterItem({this.id, this.title, this.isSelected});

  InterItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isSelected = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['is_selected'] = this.isSelected;
    return data;
  }
}
