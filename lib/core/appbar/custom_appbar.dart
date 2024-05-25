import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

import '../core.dart';

AppBar customAppBar({
  required String title,
  required BuildContext context,
  List<Widget>? actions,
  Widget? leading,
  PreferredSizeWidget? bottomWidget,
  bool isBackButton = true,
  VoidCallback? onBack,
}) {
  return AppBar(
    centerTitle: true,
    leading: leading ??
        (isBackButton
            ? Bounce(
                duration: const Duration(milliseconds: 150),
                onTap: () {
                  if (onBack != null) {
                    onBack();
                  }
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: ColorTheme.whiteColor,
                  ),
                ),
              )
            : null),
    backgroundColor: ColorTheme.orange,
    bottom: bottomWidget,
    elevation: 0,
    title: Text(
      title,
      style: FontUtilities.style(
          fontSize: 18,
          fontWeight: FWT.semiBold,
          fontColor: ColorTheme.whiteColor),
    ),
    actions: actions != null
        ? [
            SizedBox(
              height: 36,
              child: Row(
                children: actions,
              ),
            )
          ]
        : null,
  );
}
