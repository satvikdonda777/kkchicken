class InvoiceResponseModel {
  String? status;
  Order? order;
  List<Details>? details;

  InvoiceResponseModel({this.status, this.order, this.details});

  InvoiceResponseModel.fromJson(Map<String, dynamic> json) {
    print("Orderrrrr: ${json}");
    status = json['status'];
    order = json['Order'] != null ? Order.fromJson(json['Order']) : null;
    if (json['Details'] != null) {
      details = <Details>[];
      json['Details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (order != null) {
      data['Order'] = order!.toJson();
    }
    if (details != null) {
      data['Details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
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
  String? others;
  String? ordertime;
  String? delivertime;

  Order(
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
      this.others,
      this.ordertime,
      this.delivertime});

  Order.fromJson(Map<String, dynamic> json) {
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
    others = json['others'];
    ordertime = json['ordertime'];
    delivertime = json['delivertime'];
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
    data['others'] = others;
    data['ordertime'] = ordertime;
    data['delivertime'] = delivertime;
    return data;
  }
}

class Details {
  int? id;
  String? orderid;
  String? itemname;
  String? itemquantity;
  String? itemquantitytype;
  String? mquantity;
  String? itemprice;
  String? itemtotal;

  Details(
      {this.id,
      this.orderid,
      this.itemname,
      this.itemquantity,
      this.itemquantitytype,
      this.mquantity,
      this.itemprice,
      this.itemtotal});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderid = json['orderid'];
    itemname = json['itemname'];
    itemquantity = json['itemquantity'];
    itemquantitytype = json['itemquantitytype'];
    mquantity = json['Mquantity'];
    itemprice = json['itemprice'];
    itemtotal = json['itemtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderid'] = orderid;
    data['itemname'] = itemname;
    data['itemquantity'] = itemquantity;
    data['itemquantitytype'] = itemquantitytype;
    data['Mquantity'] = mquantity;
    data['itemprice'] = itemprice;
    data['itemtotal'] = itemtotal;
    return data;
  }
}
