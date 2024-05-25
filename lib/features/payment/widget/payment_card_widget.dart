import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/payment/model/payment_type_model.dart';

class PaymentCardWidget extends StatelessWidget {
  final PaymentTypeModel paymentTypeModel;
  final VoidCallback onTap;
  final int selectedIndex;
  final int currentIndex;
  const PaymentCardWidget(
      {super.key,
      required this.paymentTypeModel,
      required this.onTap,
      required this.selectedIndex,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 150),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: ColorTheme.whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 2),
                  blurRadius: 2,
                  color: ColorTheme.blackColor.withOpacity(0.25))
            ]),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: selectedIndex == currentIndex
                        ? ColorTheme.orange
                        : ColorTheme.blackColor,
                    width: 2),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedIndex == currentIndex
                        ? ColorTheme.orange
                        : ColorTheme.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            SvgPicture.asset(paymentTypeModel.iconName),
            const SizedBox(
              width: 12,
            ),
            Text(
              paymentTypeModel.paymentTypeName,
              style: FontUtilities.style(fontSize: 14, fontWeight: FWT.medium),
            ),
            if (paymentTypeModel.otherIcon != null) ...{
              const SizedBox(
                width: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: List.generate(paymentTypeModel.otherIcon!.length,
                      (i) => SvgPicture.asset(paymentTypeModel.otherIcon![i])),
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}
