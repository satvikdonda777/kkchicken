import 'package:bounce/bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kk_chicken/core/cached_image/cached_image_widget.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/home/model/home_model.dart';

class ChickenFoodCard extends StatelessWidget {
  final HomeData chickenFoodModel;
  final VoidCallback onTap;
  final VoidCallback onAddTap;
  const ChickenFoodCard(
      {super.key,
      required this.chickenFoodModel,
      required this.onAddTap,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 150),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorTheme.grey),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 1,
                  color: ColorTheme.grey.withOpacity(0.5))
            ]),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedImageWidget(
                        imageUrl: chickenFoodModel.thumbnail ?? '',
                        width: double.maxFinite,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${chickenFoodModel.name}",
                    style: FontUtilities.style(
                        fontSize: 11, fontColor: const Color(0xFF333333)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    chickenFoodModel.quantity ?? '',
                    style: FontUtilities.style(
                        fontSize: 11, fontColor: const Color(0xFF333333)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  if (chickenFoodModel.offer == "YES") ...{
                    Row(
                      children: [
                        Text(
                          "₹${chickenFoodModel.mrp ?? ''} ",
                          style: FontUtilities.style(
                              fontSize: 11, fontColor: ColorTheme.red),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "₹ ${chickenFoodModel.price}",
                          style: const TextStyle(
                              color: ColorTheme.darkGrey,
                              fontSize: 11,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: ColorTheme.grey,
                              fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  } else ...{
                    Text(
                      "₹ ${chickenFoodModel.mrp}",
                      style: const TextStyle(
                          color: ColorTheme.blackColor,
                          fontSize: 11,
                          decorationColor: ColorTheme.blackColor,
                          fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  },
                  const Spacer(),
                  if (chickenFoodModel.instock == 'YES') ...{
                    CustomFlatButton(
                      width: double.maxFinite,
                      onPressed: onAddTap,
                      title: "ADD",
                    ),
                  } else ...{
                    CustomFlatButton(
                      width: double.maxFinite,
                      onPressed: () {},
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                      ),
                      backgroundColor: ColorTheme.darkGrey,
                      title: "OUT OF STOKE",
                    ),
                  },
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            if (chickenFoodModel.offer == "YES")
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 25,
                  width: 70,
                  margin: const EdgeInsets.only(left: 2, top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorTheme.orange,
                  ),
                  child: Center(
                    child: Text(
                      "${100 - (int.parse(chickenFoodModel.price ?? '0') * 100) ~/ int.parse(chickenFoodModel.mrp ?? '0')}% OFF",
                      style: FontUtilities.style(
                          fontSize: 12,
                          fontWeight: FWT.semiBold,
                          fontColor: ColorTheme.whiteColor),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
