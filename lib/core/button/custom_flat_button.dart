import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

import '../core.dart';

class CustomFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  const CustomFlatButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.width,
      this.padding,
      this.borderRadius,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onPressed,
      duration: const Duration(milliseconds: 150),
      child: Container(
        height: 44,
        width: width,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            color: backgroundColor ?? ColorTheme.orange),
        child: Center(
          child: Text(
            title,
            style: FontUtilities.style(
              fontSize: 16,
              fontWeight: FWT.bold,
              fontColor: ColorTheme.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
