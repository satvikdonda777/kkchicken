// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/config/navigation.dart/app_route.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/payment/data/payment_data.dart';
import 'package:kk_chicken/features/payment/provider/payment_provider.dart';
import 'package:kk_chicken/features/payment/widget/payment_card_widget.dart';
import 'package:provider/provider.dart';

// @RoutePage()
class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Payment", context: context),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Select Payment Mode',
              style: FontUtilities.style(fontSize: 16, fontWeight: FWT.medium),
            ),
          ),
          Consumer<PaymentProvider>(builder: (context, paymentProvider, child) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: PaymentData.paymentTypeList.length,
              itemBuilder: (context, index) {
                return PaymentCardWidget(
                  paymentTypeModel: PaymentData.paymentTypeList[index],
                  selectedIndex: paymentProvider.selectedIndex,
                  currentIndex: index,
                  onTap: () {
                    paymentProvider.setPaymentMethodIndex(index);
                  },
                );
              },
            );
          }),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: CustomFlatButton(
              onPressed: () {
                // context.router.push(PaymentStatScreenRoute(orderId: ''));
              },
              title: "Make Payment",
              borderRadius: 8,
            ),
          ),
          const Spacer()
        ],
      )),
    );
  }
}
