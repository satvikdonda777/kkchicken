class MyOrderModel {
  String? status;
  List<MyOrder>? orderList;

  MyOrderModel({this.status, this.orderList});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Data'] != null) {
      orderList = <MyOrder>[];
      json['Data'].forEach((v) {
        orderList!.add(MyOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (orderList != null) {
      data['Data'] = orderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyOrder {
  int? orderid;
  String? userId;
  String? fname;
  String? mobile;
  String? city;
  String? area;
  String? address;
  String? status;
  String? total;
  String? shipping;
  String? paymenttype;
  String? payid;
  String? coupon;
  String? couponprice;
  String? lat;
  String? lng;
  String? dtype;
  String? dcode;
  String? driverid;
  String? name;
  String? ordertime;

  MyOrder(
      {this.orderid,
      this.userId,
      this.fname,
      this.mobile,
      this.city,
      this.area,
      this.address,
      this.status,
      this.total,
      this.shipping,
      this.paymenttype,
      this.payid,
      this.coupon,
      this.couponprice,
      this.lat,
      this.lng,
      this.dtype,
      this.dcode,
      this.driverid,
      this.name,
      this.ordertime});

  MyOrder.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'];
    userId = json['user_id'];
    fname = json['fname'];
    mobile = json['mobile'];
    city = json['city'];
    area = json['area'];
    address = json['address'];
    status = json['status'];
    total = json['total'];
    shipping = json['shipping'];
    paymenttype = json['paymenttype'];
    payid = json['payid'];
    coupon = json['coupon'];
    couponprice = json['couponprice'];
    lat = json['lat'];
    lng = json['lng'];
    dtype = json['dtype'];
    dcode = json['dcode'];
    driverid = json['driverid'];
    name = json['name'];
    ordertime = json['ordertime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderid'] = orderid;
    data['user_id'] = userId;
    data['fname'] = fname;
    data['mobile'] = mobile;
    data['city'] = city;
    data['area'] = area;
    data['address'] = address;
    data['status'] = status;
    data['total'] = total;
    data['shipping'] = shipping;
    data['paymenttype'] = paymenttype;
    data['payid'] = payid;
    data['coupon'] = coupon;
    data['couponprice'] = couponprice;
    data['lat'] = lat;
    data['lng'] = lng;
    data['dtype'] = dtype;
    data['dcode'] = dcode;
    data['driverid'] = driverid;
    data['name'] = name;
    data['ordertime'] = ordertime;
    return data;
  }
}
