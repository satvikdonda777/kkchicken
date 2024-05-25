// ignore_for_file: equal_elements_in_set

// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/features/order/provider/order_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/invoice_item_card_widget.dart';

// @RoutePage()
class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Invoice', context: context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Consumer<OrderProvider>(
                builder: (context, orderProvider, child) {
              if (orderProvider.invoiceResponseModel == null ||
                  orderProvider.invoiceResponseModel!.order == null) {
                return const Center(
                  child: Text(
                    "No data found",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                );
              }
              return Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    onTap: () {},
                    labelText: 'Order ID',
                    controller: TextEditingController(
                        text: (orderProvider
                                    .invoiceResponseModel!.order!.orderid ??
                                0)
                            .toString()),
                    labelTextColor: ColorTheme.blackColor,
                    isBorderVisible: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    onTap: () {},
                    labelText: 'Name',
                    controller: TextEditingController(
                        text:
                            orderProvider.invoiceResponseModel!.order!.fname ??
                                ""),
                    labelTextColor: ColorTheme.blackColor,
                    isBorderVisible: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    onTap: () {},
                    labelText: 'Mobile',
                    controller: TextEditingController(
                        text:
                            orderProvider.invoiceResponseModel!.order!.mobile),
                    labelTextColor: ColorTheme.blackColor,
                    isBorderVisible: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    onTap: () {},
                    labelText: 'City',
                    controller: TextEditingController(
                        text: orderProvider.invoiceResponseModel!.order!.city),
                    labelTextColor: ColorTheme.blackColor,
                    isBorderVisible: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    onTap: () {},
                    labelText: 'Area',
                    controller: TextEditingController(
                        text: orderProvider.invoiceResponseModel!.order!.area),
                    labelTextColor: ColorTheme.blackColor,
                    isBorderVisible: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    onTap: () {},
                    labelText: 'Address',
                    maxLine: 3,
                    controller: TextEditingController(
                        text:
                            orderProvider.invoiceResponseModel!.order!.address),
                    labelTextColor: ColorTheme.blackColor,
                    isBorderVisible: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    onTap: () {},
                    labelText: 'Delivery Date',
                    controller: TextEditingController(
                        text: DateFormat('dd/MM/yyyy')
                            .format(DateFormat("yyyy-MM-dd").parse(orderProvider
                                    .invoiceResponseModel!.order!.ordertime ??
                                ''))
                            .toString()),
                    labelTextColor: ColorTheme.blackColor,
                    isBorderVisible: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    onTap: () {},
                    labelText: 'Delivery Time',
                    controller: TextEditingController(
                        text: DateFormat('HH:mm a')
                            .format(DateFormat("yyyy-MM-dd").parse(orderProvider
                                    .invoiceResponseModel!.order!.ordertime ??
                                ''))
                            .toString()),
                    labelTextColor: ColorTheme.blackColor,
                    isBorderVisible: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    color: ColorTheme.extraLightGrey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Price',
                                    style: FontUtilities.style(
                                        fontSize: 14, fontWeight: FWT.medium),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹${orderProvider.invoiceResponseModel!.order!.total}',
                                    style: FontUtilities.style(
                                        fontSize: 14, fontWeight: FWT.medium),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Delivery Charge',
                                    style: FontUtilities.style(
                                        fontSize: 14, fontWeight: FWT.medium),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹${orderProvider.invoiceResponseModel!.order!.shipping}',
                                    style: FontUtilities.style(
                                        fontSize: 14, fontWeight: FWT.medium),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Coupon Amount',
                                    style: FontUtilities.style(
                                        fontSize: 14, fontWeight: FWT.medium),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '₹${orderProvider.invoiceResponseModel!.order!.couponprice}',
                                    style: FontUtilities.style(
                                        fontSize: 14, fontWeight: FWT.medium),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: ColorTheme.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                'Total Amount',
                                style: FontUtilities.style(
                                    fontSize: 16,
                                    fontWeight: FWT.semiBold,
                                    fontColor: ColorTheme.whiteColor),
                              ),
                              const Spacer(),
                              Text(
                                '₹${int.parse(orderProvider.invoiceResponseModel!.order!.total ?? '') + (int.parse(orderProvider.invoiceResponseModel!.order!.shipping ?? '') - (int.parse(orderProvider.invoiceResponseModel!.order!.couponprice ?? '')))}',
                                style: FontUtilities.style(
                                  fontSize: 16,
                                  fontWeight: FWT.semiBold,
                                  fontColor: ColorTheme.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if (orderProvider.invoiceResponseModel!.details !=
                                null &&
                            orderProvider
                                .invoiceResponseModel!.details!.isNotEmpty) ...{
                          Container(
                            color: ColorTheme.orange,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Item',
                                    style: FontUtilities.style(
                                        fontSize: 16,
                                        fontWeight: FWT.semiBold,
                                        fontColor: ColorTheme.whiteColor),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Qty',
                                    style: FontUtilities.style(
                                      fontSize: 16,
                                      fontWeight: FWT.semiBold,
                                      fontColor: ColorTheme.whiteColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Type',
                                    style: FontUtilities.style(
                                      fontSize: 16,
                                      fontWeight: FWT.semiBold,
                                      fontColor: ColorTheme.whiteColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Price',
                                  style: FontUtilities.style(
                                    fontSize: 16,
                                    fontWeight: FWT.semiBold,
                                    fontColor: ColorTheme.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: orderProvider
                                .invoiceResponseModel!.details!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InvoiceCardModels(
                                  invoiceModel: orderProvider
                                      .invoiceResponseModel!.details![index]);
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        }
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
