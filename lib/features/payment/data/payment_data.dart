import '../../../core/core.dart';
import '../model/payment_type_model.dart';

class PaymentData {
  static List<PaymentTypeModel> paymentTypeList = [
    PaymentTypeModel(
        iconName: AppImage.wallet,
        paymentTypeName: 'Credit/Debit Card',
        otherIcon: [AppImage.visa, AppImage.rupay, AppImage.masterCard]),
    PaymentTypeModel(
        iconName: AppImage.upi, paymentTypeName: 'Google pay/other'),
    PaymentTypeModel(iconName: AppImage.paytm, paymentTypeName: 'PayTM'),
    PaymentTypeModel(
        iconName: AppImage.netBanking, paymentTypeName: 'Net Banking'),
  ];
}
