// ignore_for_file: use_build_context_synchronously

// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kk_chicken/features/order/model/invoice_model.dart';
import 'package:kk_chicken/features/order/model/order_model.dart';
import 'package:kk_chicken/features/order/repo/order_repo.dart';
import 'package:kk_chicken/features/order/view/invoice_view.dart';
import 'package:kk_chicken/features/order/view/my_order_screen.dart';

import '../../../config/config.dart';
import '../../../core/widgets/fancy_snackbar/fancy_snackbar.dart';

class OrderProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<MyOrder>? myOrder;
  InvoiceResponseModel? invoiceResponseModel;
  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  final OrderRepo _orderRepo = OrderRepo();

  Future<void> getMyOrder({required BuildContext context}) async {
    try {
      EasyLoading.show();
      MyOrderModel? myOrderModel = await _orderRepo.getMyOrderList(context);
      if (myOrderModel != null) {
        myOrder = myOrderModel.orderList;
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const MyOrderScreen();
          },
        ));
        // context.router.push(const MyOrderScreenRoute());
        EasyLoading.dismiss();
        notifyListeners();
      }
    } catch (e) {
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getOrderInvoice(
      {required BuildContext context, required int orderId}) async {
    try {
      EasyLoading.show();
      InvoiceResponseModel? invoiceResponseModelAPI =
          await _orderRepo.getOrderInvoice(context, orderId);
      if (invoiceResponseModelAPI != null) {
        invoiceResponseModel = invoiceResponseModelAPI;
        // context.router.push(const InvoiceScreenRoute());
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const InvoiceScreen();
          },
        ));
        EasyLoading.dismiss();
        notifyListeners();
      }
    } catch (e) {
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> cancelOrder(
      {required BuildContext context, required int orderId}) async {
    try {
      EasyLoading.show();
      Map<String, dynamic>? cancelOrderStatus =
          await _orderRepo.cancelOrder(context, orderId);
      if (cancelOrderStatus != null) {
        Navigator.pop(context);
        FancySnackbar.showSnackbar(context,
            snackBarType: FancySnackBarType.success,
            message: "Order Cancelled Successfully");
        Navigator.pop(context);
        EasyLoading.dismiss();
        notifyListeners();
      }
    } catch (e) {
      EasyLoading.dismiss();
      FancySnackbar.showSnackbar(context,
          snackBarType: FancySnackBarType.error, message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
