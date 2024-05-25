// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../core.dart';

class CustomToggleButton extends StatelessWidget {
  var provider;
  final List<String> textList;
  CustomToggleButton(
      {super.key, required this.provider, required this.textList});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        color: ColorTheme.lightGrey,
        height: 50,
        width: double.maxFinite,
        child: Row(
          children: List.generate(2, (index) {
            return Expanded(
                child: GestureDetector(
              onTap: () {
                provider.changeCurrentIndex(index);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: provider.currentIndex == index
                        ? ColorTheme.whiteColor
                        : ColorTheme.lightGrey),
                child: Center(
                  child: Text(
                    textList[index],
                    style: FontUtilities.style(
                        fontSize: 16, fontWeight: FWT.semiBold),
                  ),
                ),
              ),
            ));
          }),
        ));
  }
}
