import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/core/cached_image/cached_image_widget.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/cart/model/cart_model.dart';

class CartCardWidget extends StatelessWidget {
  final CartData cartModel;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  const CartCardWidget(
      {super.key,
      required this.cartModel,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedImageWidget(
              imageUrl: cartModel.thumbnail ?? '',
              height: 80.hPr(context),
              width: 80.wPr(context),
            )),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartModel.itemname ?? '',
                style:
                    FontUtilities.style(fontSize: 13, fontWeight: FWT.semiBold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                cartModel.mquantity ?? '',
                style:
                    FontUtilities.style(fontSize: 14, fontWeight: FWT.regular),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "QTY:  ${cartModel.itemquantity}",
                style:
                    FontUtilities.style(fontSize: 14, fontWeight: FWT.regular),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "₹${cartModel.itemprice}",
              style: FontUtilities.style(fontSize: 14, fontWeight: FWT.regular),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Bounce(
                  duration: const Duration(milliseconds: 150),
                  onTap: onRemove,
                  child: Container(
                    height: 30.hPr(context),
                    width: 30.wPr(context),
                    decoration: BoxDecoration(
                      color: ColorTheme.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.remove,
                        color: ColorTheme.whiteColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30.hPr(context),
                  width: 30.wPr(context),
                  decoration: const BoxDecoration(
                    color: ColorTheme.grey,
                  ),
                  child: Center(
                    child: Text(
                      cartModel.itemquantity.toString(),
                      style: FontUtilities.style(
                          fontSize: 12,
                          fontColor: ColorTheme.whiteColor,
                          fontWeight: FWT.bold),
                    ),
                  ),
                ),
                Bounce(
                  duration: const Duration(milliseconds: 150),
                  onTap: onAdd,
                  child: Container(
                    height: 30.hPr(context),
                    width: 30.wPr(context),
                    decoration: BoxDecoration(
                      color: ColorTheme.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: ColorTheme.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
