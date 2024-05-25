import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kk_chicken/features/order/provider/order_provider.dart';
import 'package:kk_chicken/features/order/widgets/order_card_widget.dart';
import 'package:provider/provider.dart';

class NormalOrderVew extends StatefulWidget {
  const NormalOrderVew({super.key});

  @override
  State<NormalOrderVew> createState() => _NormalOrderVewState();
}

class _NormalOrderVewState extends State<NormalOrderVew> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:
            Consumer<OrderProvider>(builder: (context, orderProvider, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 12,
              ),
              if (orderProvider.myOrder!.isEmpty) ...{
                SizedBox(
                  height: MediaQuery.of(context).size.height - 130,
                  child: const Center(
                    child: Text(
                      "No Order Found",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                )
              } else ...{
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderProvider.myOrder!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return OrderCardWidget(
                      orderModel: orderProvider.myOrder![index],
                      index: index,
                    );
                  },
                )
              }
            ],
          );
        }),
      ),
    );
  }
}
