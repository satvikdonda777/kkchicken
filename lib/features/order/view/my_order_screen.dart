// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/order/provider/order_provider.dart';
import 'package:kk_chicken/features/order/view/normal_order_view.dart';
import 'package:provider/provider.dart';

// @RoutePage()
class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'My order', context: context),
      body: SafeArea(child:
          Consumer<OrderProvider>(builder: (context, orderProvider, child) {
        return const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 12,
            ),
            // CustomToggleButton(
            //   textList: const ['Normal', 'Bulk'],
            //   provider: orderProvider,
            // ),
            // if (orderProvider.currentIndex == 0) ...{
            NormalOrderVew()
            // } else ...{
            //   const BulkOrderView()
            // }
          ],
        );
      })),
    );
  }
}
