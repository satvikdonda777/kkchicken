class CategoryResponseModel {
  String? status;
  List<Category>? category;

  CategoryResponseModel({this.status, this.category});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? cname;
  String? thumbnail;
  String? cuid;

  Category({this.id, this.cname, this.thumbnail, this.cuid});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cname = json['cname'];
    thumbnail = json['thumbnail'];
    cuid = json['cuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cname'] = cname;
    data['thumbnail'] = thumbnail;
    data['cuid'] = cuid;
    return data;
  }
}
