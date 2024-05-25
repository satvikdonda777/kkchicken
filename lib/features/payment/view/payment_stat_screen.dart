// ignore_for_file: deprecated_member_use

// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kk_chicken/config/config.dart';
import 'package:kk_chicken/core/core.dart';

// @RoutePage()
class PaymentStatScreen extends StatelessWidget {
  final String orderId;
  const PaymentStatScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Thanks',
        context: context,
        isBackButton: true,
        onBack: () {
          // Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pop(context);
          Navigator.pop(context);
          // Navigator.pop(context);
        },
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          return false;
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.hPr(context),
              ),
              Center(
                child: SvgPicture.asset(
                  AppImage.success,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  'ORDER ID : $orderId',
                  style: FontUtilities.style(
                      fontSize: 20, fontWeight: FWT.semiBold),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  """Thanks for placing order. All details of shipping
              Of orders, status, delivery shall be sent to you
              via an sms or email""",
                  style: FontUtilities.style(
                    fontSize: 14,
                    fontWeight: FWT.regular,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
