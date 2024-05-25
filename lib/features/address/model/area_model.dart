class AreaModel {
  String? status;
  String? deliveryAvailable;
  List<Areas>? areas;

  AreaModel({this.status, this.areas, this.deliveryAvailable});

  AreaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    deliveryAvailable = json['delivery_available'];
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['delivery_available'] = deliveryAvailable;
    if (areas != null) {
      data['areas'] = areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  int? id;
  String? city;
  String? pincode;

  Areas({this.id, this.city, this.pincode});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city'] = city;
    data['pincode'] = pincode;
    return data;
  }
}
