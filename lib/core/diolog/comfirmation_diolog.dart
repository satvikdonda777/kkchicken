// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kk_chicken/core/core.dart';

class ConfirmationDiolog extends StatelessWidget {
  final String sureText;
  final String confirmText;
  final String buttonText;
  final VoidCallback onTap;
  bool isDeliveryStatus;

  ConfirmationDiolog(
      {super.key,
      required this.buttonText,
      required this.confirmText,
      required this.onTap,
      required this.sureText,
      this.isDeliveryStatus = false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              sureText,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              confirmText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomFlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: "Cancel",
                  backgroundColor: ColorTheme.darkGrey,
                ),
                const SizedBox(
                  width: 12,
                ),
                if (!isDeliveryStatus)
                  CustomFlatButton(
                    onPressed: onTap,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: buttonText,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
