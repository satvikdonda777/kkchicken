import 'package:flutter/cupertino.dart';

class PaymentProvider extends ChangeNotifier {
  int selectedIndex = -1;
  void setPaymentMethodIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
