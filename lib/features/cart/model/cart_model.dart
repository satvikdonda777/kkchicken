class CartModel {
  String? status;
  List<CartData>? cartData;
  int? totalCount;

  CartModel({this.status, this.cartData, this.totalCount});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['cartData'] != null) {
      cartData = <CartData>[];
      json['cartData'].forEach((v) {
        cartData!.add(CartData.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (cartData != null) {
      data['cartData'] = cartData!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    return data;
  }
}

class CartData {
  int? cartId;
  int? userId;
  int? itemid;
  String? itemname;
  String? itemquantity;
  String? itemquantitytype;
  String? mquantity;
  String? itemprice;
  String? itemtotal;
  String? thumbnail;
  double? totalPrice;

  CartData(
      {this.cartId,
      this.userId,
      this.itemname,
      this.itemquantity,
      this.itemquantitytype,
      this.mquantity,
      this.itemprice,
      this.itemtotal,
      this.thumbnail,
      this.totalPrice,
      this.itemid});

  CartData.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    userId = json['user_id'];
    itemname = json['itemname'];
    itemquantity = json['itemquantity'];
    itemquantitytype = json['itemquantitytype'];
    mquantity = json['Mquantity'];
    itemprice = json['itemprice'];
    itemtotal = json['itemtotal'];
    thumbnail = json['thumbnail'];
    itemid = json['itemid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_id'] = cartId;
    data['user_id'] = userId;
    data['itemname'] = itemname;
    data['itemquantity'] = itemquantity;
    data['itemquantitytype'] = itemquantitytype;
    data['Mquantity'] = mquantity;
    data['itemprice'] = itemprice;
    data['itemtotal'] = itemtotal;
    data['thumbnail'] = thumbnail;
    data['itemid'] = itemid;
    return data;
  }
}
