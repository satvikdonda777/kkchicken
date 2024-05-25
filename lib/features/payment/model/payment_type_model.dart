class PaymentTypeModel {
  final String iconName;
  final String paymentTypeName;
  final List<String>? otherIcon;
  PaymentTypeModel(
      {required this.iconName, required this.paymentTypeName, this.otherIcon});
}
