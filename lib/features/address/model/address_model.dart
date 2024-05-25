import 'dart:convert';

class AddressModel {
  int? id;
  String? fullName;
  String? city;
  String? area;
  String? address;
  String? mobile;

  AddressModel(
      {this.id,
      required this.fullName,
      required this.city,
      required this.area,
      required this.address,
      required this.mobile});

  factory AddressModel.def() => AddressModel(
        address: '',
        area: '',
        city: '',
        fullName: '',
        mobile: '',
        id: null,
      );
  AddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    area = json['area'];
    city = json['city'];
    fullName = json['full_name'];
    id = json['id'];
    mobile = json['mobile'];
  }

  AddressModel copyWith({
    String? title,
    String? description,
    Duration? completionTime,
    DateTime? timerStartTime,
  }) {
    return AddressModel(
      address: address,
      area: area,
      city: city,
      fullName: fullName,
      mobile: mobile,
      id: id,
    );
  }

  Map<String, dynamic> toJson() => {
        'address': address,
        'full_name': fullName,
        'city': city,
        'area': area,
        'mobile': mobile,
        'id': id,
      };

  @override
  String toString() => jsonEncode(toJson());
}
