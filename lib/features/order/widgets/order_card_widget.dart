// ignore_for_file: dead_code, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/order/data/order_data.dart';
import 'package:kk_chicken/features/order/model/order_model.dart';
import 'package:kk_chicken/features/order/provider/order_provider.dart';
import 'package:provider/provider.dart';

class OrderCardWidget extends StatefulWidget {
  final MyOrder orderModel;
  final int index;

  const OrderCardWidget({
    super.key,
    required this.index,
    required this.orderModel,
  });

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  bool buttonEnabled = true;
  DateTime? buttonCreationTime;

  @override
  void initState() {
    buttonCreationTime =
        DateTime.parse(widget.orderModel.ordertime ?? "12-05-2024");
    print("Order TIme::: ${widget.orderModel.ordertime}");
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (DateTime.now().difference(buttonCreationTime ?? DateTime.now()) >=
            const Duration(minutes: 2)) {
          buttonEnabled = false;
          timer.cancel(); // Stop the timer once the button is disabled
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<OrderProvider>(builder: (context, orderProvider, child) {
          return Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID: ${widget.orderModel.orderid}',
                        style: FontUtilities.style(
                            fontSize: 14, fontWeight: FWT.medium),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.orderModel.ordertime ?? '',
                        style: FontUtilities.style(
                            fontSize: 12,
                            fontWeight: FWT.medium,
                            fontColor: ColorTheme.darkGrey),
                      ),
                    ],
                  ),
                ),
              ),
              CustomFlatButton(
                onPressed: !buttonEnabled
                    ? () {}
                    : () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return ConfirmationDiolog(
                              buttonText: "Yes",
                              confirmText:
                                  "Are you sure want to cancle this order?",
                              onTap: () {
                                orderProvider.cancelOrder(
                                    context: context,
                                    orderId: widget.orderModel.orderid ?? 0);
                              },
                              sureText: "Cancel Order..?",
                            );
                          },
                        );
                      },
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                title: 'Cancel',
                backgroundColor:
                    buttonEnabled ? ColorTheme.orange : ColorTheme.lightGrey,
              ),
              const SizedBox(
                width: 12,
              ),
              CustomFlatButton(
                  onPressed: () async {
                    // if (orderModel.status == "Received") {
                    await orderProvider.getOrderInvoice(
                        context: context,
                        orderId: widget.orderModel.orderid ?? 0);
                    // }
                  },
                  title: 'Invoice',
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  backgroundColor:
                      //  orderModel.status == "Received"
                      //     ?
                      ColorTheme.orange
                  // : ColorTheme.lightGrey,
                  ),
              const SizedBox(
                width: 12,
              ),
            ],
          );
        }),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 2,
                width: double.infinity,
                color: ColorTheme.grey,
                child: Row(
                  children: List.generate(
                    orderState.length,
                    (index) => Container(
                        height: 2,
                        width: widget.orderModel.status == "Delivered"
                            ? (MediaQuery.of(context).size.width / 3.5) - 10
                            : widget.orderModel.status == "Confirmed"
                                ? (MediaQuery.of(context).size.width / 10) - 10
                                : (MediaQuery.of(context).size.width / 5.2) -
                                    10,
                        color: ColorTheme.indicatorColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    orderState.length,
                    (index) {
                      return Column(
                        children: [
                          SvgPicture.asset(
                            orderState[index]['icon'],
                            color: widget.orderModel.status == "Delivered"
                                ? ColorTheme.indicatorColor
                                : (widget.orderModel.status == "Confirmed" &&
                                        orderState[index]['icon'] ==
                                            AppImage.confirmed)
                                    ? ColorTheme.indicatorColor
                                    : (widget.orderModel.status == "On Way" &&
                                            (orderState[index]['icon'] ==
                                                    AppImage.confirmed ||
                                                orderState[index]['icon'] ==
                                                    AppImage.onWay))
                                        ? ColorTheme.indicatorColor
                                        : ColorTheme.grey,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            orderState[index]['title'],
                            style: FontUtilities.style(
                              fontSize: 10,
                              fontWeight: FWT.regular,
                              fontColor: widget.orderModel.status == "Delivered"
                                  ? ColorTheme.indicatorColor
                                  : (widget.orderModel.status == "Confirmed" &&
                                          orderState[index]['icon'] ==
                                              AppImage.confirmed)
                                      ? ColorTheme.indicatorColor
                                      : (widget.orderModel.status == "On Way" &&
                                              (orderState[index]['icon'] ==
                                                      AppImage.confirmed ||
                                                  orderState[index]['icon'] ==
                                                      AppImage.onWay))
                                          ? ColorTheme.indicatorColor
                                          : ColorTheme.grey,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
