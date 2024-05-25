class ShipingCost {
  String? status;
  int? shipCost;
  List<Coupons>? coupons;

  ShipingCost({this.status, this.shipCost, this.coupons});

  ShipingCost.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    shipCost = json['shipCost'];
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(Coupons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['shipCost'] = shipCost;
    if (coupons != null) {
      data['coupons'] = coupons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coupons {
  int? id;
  String? couponcode;
  String? rate;
  String? amount;

  Coupons({this.id, this.couponcode, this.rate, this.amount});

  Coupons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponcode = json['couponcode'];
    rate = json['rate'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['couponcode'] = couponcode;
    data['rate'] = rate;
    data['amount'] = amount;
    return data;
  }
}
