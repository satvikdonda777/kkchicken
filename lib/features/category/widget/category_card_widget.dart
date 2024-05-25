// import 'package:auto_route/auto_route.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kk_chicken/core/cached_image/cached_image_widget.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/category/model/category_model.dart';
import 'package:kk_chicken/features/home/provider/home_provider.dart';
import 'package:kk_chicken/features/home/view/all_chicken_view.dart';
import 'package:provider/provider.dart';

import '../../../config/config.dart';
import '../../home/model/home_model.dart';

class CategoryCardWidget extends StatelessWidget {
  final Category category;
  const CategoryCardWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Bounce(
        onTap: () {
          List<HomeData> tempChickenList = [];
          tempChickenList.addAll(homeProvider.chikenList);
          tempChickenList.addAll(homeProvider.foodList);
          List<HomeData> productList = tempChickenList
              .where((element) => element.category == category.id.toString())
              .toList();
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AllChickenView(
                  chikenList: productList, categoryName: category.cname ?? '');
            },
          ));
          // context.router.push(AllChickenViewRoute(
          //     chikenList: productList, categoryName: category.cname ?? ''));
        },
        child: Column(
          children: [
            ClipOval(
              child: CachedImageWidget(
                imageUrl: category.thumbnail ?? '',
                height: 80.hPr(context),
                width: 80.wPr(context),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              category.cname ?? '',
              style: FontUtilities.style(fontSize: 12, fontWeight: FWT.medium),
            )
          ],
        ),
      );
    });
  }
}
