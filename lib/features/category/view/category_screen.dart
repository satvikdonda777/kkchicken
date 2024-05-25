// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/category/provider/category_provider.dart';
import 'package:kk_chicken/features/category/widget/category_card_widget.dart';
import 'package:provider/provider.dart';

// @RoutePage()
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Categories", context: context),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Consumer<CategoryProvider>(
              builder: (context, categoryProvider, child) {
            return GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              itemCount: categoryProvider.categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 30),
              itemBuilder: (context, index) {
                return CategoryCardWidget(
                  category: categoryProvider.categoryList[index],
                );
              },
            );
          })
        ],
      )),
    );
  }
}
