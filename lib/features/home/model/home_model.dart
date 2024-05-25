class HomeModel {
  String? status;
  List<HomeData>? homeData;
  List<CateData>? cateData;
  List<BannData>? bannData;
  List<Areas>? areas;
  int? cartCount;

  HomeModel(
      {this.status,
      this.homeData,
      this.cateData,
      this.bannData,
      this.areas,
      this.cartCount});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    cartCount = json['cartCount'];
    if (json['HomeData'] != null) {
      homeData = <HomeData>[];
      json['HomeData'].forEach((v) {
        homeData!.add(HomeData.fromJson(v));
      });
    }
    if (json['CateData'] != null) {
      cateData = <CateData>[];
      json['CateData'].forEach((v) {
        cateData!.add(CateData.fromJson(v));
      });
    }
    if (json['BannData'] != null) {
      bannData = <BannData>[];
      json['BannData'].forEach((v) {
        bannData!.add(BannData.fromJson(v));
      });
    }
    if (json['Areas'] != null) {
      areas = <Areas>[];
      json['Areas'].forEach((v) {
        areas!.add(Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['cartCount'] = cartCount;
    if (homeData != null) {
      data['HomeData'] = homeData!.map((v) => v.toJson()).toList();
    }
    if (cateData != null) {
      data['CateData'] = cateData!.map((v) => v.toJson()).toList();
    }
    if (bannData != null) {
      data['BannData'] = bannData!.map((v) => v.toJson()).toList();
    }
    if (areas != null) {
      data['Areas'] = areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeData {
  int? id;
  String? name;
  String? category;
  String? description;
  int? qnt = 1;
  String? price;
  String? mrp;
  String? quantity;
  String? thumbnail;
  String? homepage;
  String? offer;
  String? stockqty;
  String? instock;
  String? puid;

  HomeData(
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
      this.qnt = 1,
      this.instock,
      this.puid});

  HomeData.fromJson(Map<String, dynamic> json) {
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

class CateData {
  int? id;
  String? cname;
  String? thumbnail;
  String? cuid;

  CateData({this.id, this.cname, this.thumbnail, this.cuid});

  CateData.fromJson(Map<String, dynamic> json) {
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

class BannData {
  int? id;
  String? title;
  String? bnimg;

  BannData({this.id, this.title, this.bnimg});

  BannData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bnimg = json['bnimg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['bnimg'] = bnimg;
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
