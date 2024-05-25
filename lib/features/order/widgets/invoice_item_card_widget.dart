import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../model/invoice_model.dart';

class InvoiceCardModels extends StatelessWidget {
  final Details invoiceModel;
  const InvoiceCardModels({super.key, required this.invoiceModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              invoiceModel.itemname ?? '',
              style: FontUtilities.style(fontSize: 12, fontWeight: FWT.medium),
            ),
          ),
          Expanded(
            child: Text(
              "${invoiceModel.mquantity}No's",
              style: FontUtilities.style(fontSize: 12, fontWeight: FWT.medium),
            ),
          ),
          Expanded(
            child: Text(
              invoiceModel.itemquantitytype ?? '',
              style: FontUtilities.style(fontSize: 12, fontWeight: FWT.medium),
            ),
          ),
          Text(
            "₹${invoiceModel.itemprice ?? ''}",
            style: FontUtilities.style(fontSize: 12, fontWeight: FWT.medium),
          ),
        ],
      ),
    );
  }
}
