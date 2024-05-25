// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kk_chicken/core/core.dart';
import 'package:kk_chicken/core/widgets/fancy_snackbar/fancy_snackbar.dart';

class ItemPickerDiolog extends StatefulWidget {
  final String dialogTitle;
  final List<String> itemList;
  final Function(String value) onTap;
  final String selectedValue;
  const ItemPickerDiolog(
      {super.key,
      required this.dialogTitle,
      required this.itemList,
      required this.onTap,
      required this.selectedValue});

  @override
  State<ItemPickerDiolog> createState() => _ItemPickerDiologState();
}

class _ItemPickerDiologState extends State<ItemPickerDiolog> {
  int selectedIndex = -1;
  @override
  void initState() {
    selectedIndex = widget.itemList
        .indexWhere((element) => element == widget.selectedValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Text(
                widget.dialogTitle,
                style: const TextStyle(
                    color: ColorTheme.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            color: selectedIndex == index
                                ? Colors.grey.shade300
                                : null,
                            child: Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                widget.itemList[index],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            )),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: widget.itemList.length),
            ),
            const Divider(),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // context.router.pop();
                      },
                      child: const Text(
                        'Dismiss',
                        style: TextStyle(
                            color: ColorTheme.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                  const Spacer(),
                  const VerticalDivider(),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        if (selectedIndex == -1) {
                          FancySnackbar.showSnackbar(context,
                              snackBarType: FancySnackBarType.error,
                              message: "PLease Choose Value");
                        } else {
                          Navigator.pop(context);
                          widget.onTap(widget.itemList[selectedIndex]);
                        }
                      },
                      child: const Text(
                        'Okay',
                        style: TextStyle(
                            color: ColorTheme.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
