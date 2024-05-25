import 'package:dio/dio.dart';
import 'package:kk_chicken/core/consts/api_const.dart';

class APIService {
  Dio dio = Dio();
  Future<Response?> login(Map<String, dynamic> data) async {
    return dio.post(APIConst.login, data: data);
  }

  Future<Response?> register(Map<String, dynamic> data) async {
    return dio.post(APIConst.register, data: data);
  }

  Future<Response?> getCetegory() async {
    return dio
        .post(APIConst.category, data: {APIConst.tokenKey: APIConst.TOKEN});
  }

  Future<Response?> getOffer() async {
    return dio.post(APIConst.offer, data: {APIConst.tokenKey: APIConst.TOKEN});
  }

  Future<Response?> getProducts(Map<String, dynamic>? params) async {
    return dio.post(APIConst.products, data: params);
  }

  Future<Response?> placeOrder(Map<String, dynamic>? params) async {
    return dio.post(APIConst.placeOrder, data: params);
  }

  Future<Response?> getHomeData(Map<String, dynamic> params) async {
    return dio.post(APIConst.home, data: params);
  }

  Future<Response?> fetchOrder(Map<String, dynamic> params) async {
    return dio.post(APIConst.fetchOrder, data: params);
  }

  Future<Response?> getOrderDetails(Map<String, dynamic> params) async {
    return dio.post(APIConst.orderDetail, data: params);
  }

  Future<Response?> updateProfile(Map<String, dynamic> params) async {
    return dio.post(APIConst.updateProfile, data: params);
  }

  Future<Response?> updatePassword(Map<String, dynamic> params) async {
    return dio.post(APIConst.updatePassword, data: params);
  }

  Future<Response?> cancelOrder(Map<String, dynamic> params) async {
    return dio.post(APIConst.cancelOrder, data: params);
  }

  Future<Response?> addToCart(Map<String, dynamic> params) async {
    return dio.post(APIConst.addToCart, data: params);
  }

  Future<Response?> getMyCart(Map<String, dynamic> params) async {
    return dio.post(APIConst.getMyCart, data: params);
  }

  Future<Response?> clearCart(Map<String, dynamic> params) async {
    return dio.post(APIConst.deleteCart, data: params);
  }

  Future<Response?> getShipingCost(Map<String, dynamic> params) async {
    return dio.post(APIConst.getShipingCost, data: params);
  }

  Future<Response?> forgotPassword(Map<String, dynamic> params) async {
    return dio.post(APIConst.forgotPassword, data: params);
  }

  Future<Response?> increaseItemQuantity(Map<String, dynamic> params) async {
    return dio.post(APIConst.increaseItemQuantity, data: params);
  }

  Future<Response?> decreaseItemQuantity(Map<String, dynamic> params) async {
    return dio.post(APIConst.decreaseItemQuantity, data: params);
  }

  Future<Response?> getAvailableArea(Map<String, dynamic> params) async {
    return dio.post(APIConst.getArea, data: params);
  }

  Future<Response?> getDeliveryTimeSlot() async {
    return dio
        .post(APIConst.getDeliveryTimeSlot, data: {"token": APIConst.TOKEN});
  }

  Future<Response?> getUserCurrentLocation(Map<String, dynamic> params) async {
    return dio.post(APIConst.getUserCurrentLocation, data: params);
  }
}
