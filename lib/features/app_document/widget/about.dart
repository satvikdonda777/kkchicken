import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2,
          ),
          Text(
            """If you're looking for high-quality meat delivery that offers a wide selection of fresh chicken meat, look no further.""",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                    """Wide Selection of Fresh Chicken meat: K.K Chicken offers a diverse range of fresh chicken meat options to choose from, ensuring that customers can find what they need for their meals.\n
Convenient Delivery: K.K. Chicken offers doorstep delivery, making it easy and convenient for customers to get the fresh meat they need without leaving their homes.\n

Quality and Freshness Guaranteed: K.K Chicken sources its products directly from trusted suppliers, ensuring that the meat is of the highest quality and freshness.""")
              ],
            ),
          )
        ],
      ),
    );
  }
}
