import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "KK Chicken",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            """# 131/3A, M.V Commercial Complex, ShopNo 15, Ground Floor,\n 
Novodaya Naga, Kothanur Dinne Main Road, J.P. \n
Nagar 7th Phase, Bengaluru -560078\n\n
Phone: +91-9902266222\n
Email: info@kkchickens.com
""",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
