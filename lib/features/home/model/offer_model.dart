class OfferModel {
  String? status;
  List<Offer>? offer;

  OfferModel({this.status, this.offer});

  OfferModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      offer = <Offer>[];
      json['data'].forEach((v) {
        offer!.add(Offer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (offer != null) {
      data['data'] = offer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offer {
  int? id;
  String? name;
  String? category;
  String? description;
  String? price;
  String? mrp;
  String? quantity;
  String? thumbnail;
  String? homepage;
  String? offer;
  String? stockqty;
  String? instock;
  String? puid;

  Offer(
      {this.id,
      this.name,
      this.category,
      this.description,
      this.price,
      this.mrp,
      this.quantity,
      this.thumbnail,
      this.homepage,
      this.offer,
      this.stockqty,
      this.instock,
      this.puid});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    description = json['description'];
    price = json['price'];
    mrp = json['mrp'];
    quantity = json['quantity'];
    thumbnail = json['thumbnail'];
    homepage = json['homepage'];
    offer = json['offer'];
    stockqty = json['stockqty'];
    instock = json['instock'];
    puid = json['puid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['description'] = description;
    data['price'] = price;
    data['mrp'] = mrp;
    data['quantity'] = quantity;
    data['thumbnail'] = thumbnail;
    data['homepage'] = homepage;
    data['offer'] = offer;
    data['stockqty'] = stockqty;
    data['instock'] = instock;
    data['puid'] = puid;
    return data;
  }
}
