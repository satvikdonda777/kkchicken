// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/core/consts/api_const.dart';

import '../core.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  BoxFit? fit;
  CachedImageWidget(
      {super.key, required this.imageUrl, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${APIConst.IMAGE_URL}$imageUrl",
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => const SizedBox(
          height: 20,
          width: 20,
          child: Center(
              child: CircularProgressIndicator(
            color: ColorTheme.orange,
          ))),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
