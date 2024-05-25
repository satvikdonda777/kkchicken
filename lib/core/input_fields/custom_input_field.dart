// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core.dart';
import '../theme/font_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? helpText;
  final Widget? suffixIcon;
  final Color? labelTextColor;
  final TextInputType? textInputType;
  final bool? isObscureText;
  final String? labelText;
  final EdgeInsets? padding;
  final String? initialValue;
  final bool isBorderVisible;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final double? width;
  final int? maxLine;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChange;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.isBorderVisible = false,
    this.suffixIcon,
    this.textInputType,
    this.isObscureText,
    this.labelText,
    this.padding,
    this.onTap,
    this.labelTextColor,
    this.inputFormatters,
    this.helpText,
    this.prefixIcon,
    this.width,
    this.maxLine,
    this.validator,
    this.onChange,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...{
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(labelText!,
                  style: FontUtilities.style(
                      fontSize: 16,
                      fontWeight: FWT.medium,
                      fontColor: labelTextColor ?? ColorTheme.orange)),
            ),
            const SizedBox(height: 9),
          },
          SizedBox(
            width: width ?? double.infinity,
            child: TextFormField(
              inputFormatters: inputFormatters,
              style: FontUtilities.style(
                fontSize: 16,
                fontWeight: FWT.medium,
                fontColor: ColorTheme.blackColor,
              ),
              initialValue: initialValue,
              readOnly: onTap != null ? true : false,
              controller: controller,
              onTap: onTap,
              onChanged: onChange,
              maxLines: maxLine ?? 1,
              validator: validator,
              keyboardType: textInputType,
              obscureText: isObscureText ?? false,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                border: isBorderVisible
                    ? OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorTheme.lightGrey),
                        borderRadius: BorderRadius.circular(4),
                      )
                    : null,
                enabledBorder: isBorderVisible
                    ? OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorTheme.lightGrey),
                        borderRadius: BorderRadius.circular(4),
                      )
                    : null,
                focusedBorder: isBorderVisible
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(color: ColorTheme.grey),
                        borderRadius: BorderRadius.circular(4),
                      )
                    : null,
                disabledBorder: isBorderVisible
                    ? OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: ColorTheme.lightGrey),
                        borderRadius: BorderRadius.circular(4),
                      )
                    : null,
                errorBorder: isBorderVisible
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(color: ColorTheme.red),
                        borderRadius: BorderRadius.circular(10),
                      )
                    : null,
                isDense: false,
                hintText: hintText ?? '',
                hintStyle: FontUtilities.hintTextStyle(),
                suffixIcon: suffixIcon,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          if (helpText != null) ...{
            const SizedBox(height: 5),
            Text(helpText!,
                style: FontUtilities.style(
                  fontSize: 12,
                  fontWeight: FWT.regular,
                  fontColor: ColorTheme.red,
                )),
          }
        ],
      ),
    );
  }
}

class CustomSearchField extends StatelessWidget {
  String? Function(String? value)? onChange;
  String? hintText;
  CustomSearchField({super.key, this.onChange, this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: FontUtilities.style(
          fontSize: 16,
          fontWeight: FWT.medium,
          fontColor: ColorTheme.blackColor,
        ),
        onChanged: onChange,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorTheme.whiteColor,
          prefixIcon: SizedBox(
            height: 24,
            width: 24,
            child: Center(
              child: SvgPicture.asset(
                AppImage.search,
                height: 24,
                width: 24,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorTheme.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorTheme.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorTheme.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorTheme.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorTheme.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          isDense: true,
          hintText: hintText ?? '',
          hintStyle: FontUtilities.hintTextStyle()
              .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      ),
    );
  }
}
