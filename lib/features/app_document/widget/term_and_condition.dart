import 'package:flutter/material.dart';
import 'package:kk_chicken/core/theme/color_theme.dart';

class TermAndConditionScreen extends StatelessWidget {
  const TermAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pricing",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """Prices displayed for all the products on www.KK Chicken.com exclude GST. The prices of all products mentioned at the time of ordering will be charged on the date of the delivery except for fresh food products. In case fresh food prices are higher or lower on the date of delivery, additional charges will be collected or refunded at the time of the delivery of the order.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Delivery and Handling Charges",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """KK CHICKEN may impose delivery and handling fees and taxes from time to time. KK CHICKEN endeavors to fulfil orders on time, but the actual delivery time may differ from the delivery time stated at the time of placing the order. Delivery delays will be communicated by KK CHICKEN.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Order Cancellation",
            style: TextStyle(
                fontSize: 24,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """A Customer can opt to cancel order within 1 hour for the order placed either online or by calling our customer service and receive refund of advance paid if any. This is not applicable for Express delivery orders since those are processed and shipped immediately. To avoid any damage claims after delivery, users are recommended to inspect the product seal before accepting the order. KK CHICKEN reserves the right to cancel any order at its discretion based on product availability or if it suspects any fraudulent transaction by a customer or breaches the terms & conditions of using the platform.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Return & Refunds",
            style: TextStyle(
                fontSize: 24,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """KK CHICKEN believes in Centum Customer satisfaction and "no questions asked return and refund policy" for issues relating to quality or freshness of its supplies. Customer may request for a refund/replacement within 24 hours of delivery of the products in case of any quality issues. The mode of refund shall be as determined by KK CHICKEN from time to time, to the original payment source. However, considering the order value and challenges to refund for cash on delivery orders in particular, the refunds will be applied to the subsequent purchases.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Customer Acceptance",
            style: TextStyle(
                fontSize: 24,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            """I hereby agree upon:""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            """• To pay extra cost claimed by KK CHICKEN in the case of redelivery due to wrong name or address or any other wrong information provided while booking order.
• To use the platform to transact for lawful purposes in compliance with all applicable laws and regulation.
• To provide authentic and true information in all instances and authorize KK CHICKEN to validate the information provided at any point to time and reject registration if any details are found to be untrue wholly or partly.
• To access the services made available on the platform and to purchase the products offered at my own risk after using best and prudent judgement as a well-informed Customer.
• That the delivery address provided is correct and proper in all respects.
• That the product descriptions have been carefully checked before placing the order and agree to be bound by the terms and conditions of sale.
• That there may be excess / short quantity when ordering a cut SKU of a particular product. For example, the Steak version of a particular meat may have some variance in the final weight, given the fact it is hard to cut a fish in to an exact weight without damaging the shape of the Steak piece. In such instances, I agree to pay the difference amount at the time of delivery or adjust excess payment against next order.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Obligations of Visitor / Customer",
            style: TextStyle(
                fontSize: 24,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            """I hereby unconditionally undertake not to use the Platform for:""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            """• Disseminating any objectionable material, harassing, libelous, abusive, threatening, harmful, vulgar, obscene, or any unlawful activity.\n
• To transmit material that constitutes a criminal offence or results in civil liability or otherwise breaches any relevant laws, regulations or code of practice.\n
• To gain unauthorized access to other computer network systems.\n
• Interfere with any other person's right to use or enjoyment of the platform. Breach of applicable laws.\n
• Interfere or disrupt networks or web sites connected to the platform.\n
• Make, transmit or store electronic copies of materials protected by copyright without the permission of KK CHICKEN.\n
• To post customer review feedback in violation of this policy or right of any third party, including copyright, trademark, privacy or other personal or proprietary right(s), and cause injury to any person or entity.\n
• To post comments containing libelous or otherwise unlawful, threatening, abusive or obscene material, or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings or any form of "spam".\n
• Not to use a false email address, impersonate any person or entity, or otherwise mislead as to the origin of any Customer feedback submitted on the Platform.\n
• To be solely responsible for the content of any Customer Feedback made and agree upon to indemnify KK CHICKEN for all claims resulting from such Customer Feedback submitted.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Customer Reviews & Feedback",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Pictures & Colors",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """KK CHICKEN has made every effort to display the products and its colors on the platform as accurately as possible. KK CHICKEN does not guarantee nor take responsibility for variations in pictorial representations for fresh foods and color variation due to technical reasons""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Right to Modify Terms & Conditions of Service",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """KK CHICKEN reserves unconditional right to modify terms and conditions of transacting business on KK Chicken platform without any prior notification and consent of customers. When a registered customer accesses KK Chicken platform, he or she is deemed to have accepted the latest version of the Terms & Conditions on the Site.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Governing Law and Jurisdiction",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """All disputes arising out of or in doing business on the platform shall be amicably settled at the first instance by mutual discussions and negotiations. In the event the dispute is not resolved then the same may be referred to arbitration in accordance with the provisions of the Arbitration and Conciliation Act, 1996 or any enactment of statutory modification thereof. The arbitration proceedings shall be in the English language and shall be held in Bangalore. The award of the arbitral tribunal shall be final and binding upon the parties and no appeal against the same shalt lie to any court. The courts of competent jurisdiction in Bangalore shall have exclusive jurisdiction over any dispute, differences or claims arising out of this agreement.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Copyright & Trademark Rights",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """The Customer acknowledges that access to this platform does not confer and shall not be considered as conferring upon anyone any license under any of KK CHICKEN or any third party's intellectual property rights. KK CHICKEN expressly reserve all intellectual property rights in all text, programs, products, processes, technology, content, and other materials, which appear on the Platform. All rights, including copyright, on this platform is owned by KK CHICKEN. Any use of this platform or its contents, including copying or storing it either in whole or part, is prohibited without the permission of KK CHICKEN. The names and logos and all related product and service names, design marks and slogans are the trademarks or service marks of KK CHICKEN. References on KK Chicken Platform to any names, marks, products, or services of third parties or hypertext links to third party sites or information provided is solely for customer convenience and does not in any way constitute or imply KK CHICKEN endorsement, sponsorship or recommendation of the third party, information, product or service. KK CHICKEN is not responsible for content of any third-party sites and does not make any representations regarding the content or accuracy of material on such sites. Customers deciding to link to any such third-party websites, are doing entirely at their own risk. All materials, including images, text, illustrations, designs, icons, photographs, programs, music clips or downloads, video clips and written and other materials hosted on KK Chicken platform (collectively, the "Promotional Material") are intended solely for customer convenience. All software used in KK Chicken platform is the property of KK CHICKEN or its licensees and protected by copyright laws. The Contents and software in KK Chicken platform are to be used only as a shopping resource. Any other use, including the reproduction, modification, distribution, transmission, republication, display, of the Contents on this platform is strictly prohibited. All Contents are copyrights, trademarks, and/or other intellectual property owned, controlled, or licensed are by KK CHICKEN and its affiliates and are protected by copyright laws. The compilation (meaning the collection, arrangement, and assembly) of all Contents on this platform is the exclusive property of KK CHICKEN and is also protected by copyright laws.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Objectionable Material",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """While all IT security measures are taken to ensure wholesome and socially acceptable content are available on KK Chicken platform, notwithstanding the best efforts the customer understands and accepts the risk that while using this platform or any services provided on the www.KK Chicken.com, one may encounter Content that may be deemed by some to be offensive, indecent, or objectionable, which Content may or may not be identified as such. KK CHICKEN and its affiliates shall have no liability to Customer for Content that may be deemed offensive, indecent, or objectionable to you.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Indemnity",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """As a Customer, I hereby agree upon to defend, indemnify and hold harmless KK CHICKEN, its employees, directors, officers, agents and their successors and assigns from and against any and all claims, liabilities, damages, losses, costs and expenses, including attorney's fees, caused by or arising out of claims based upon my actions or inactions, which may result in any loss or liability to KK CHICKEN or any third party including but not limited to breach of any warranties, representations or undertakings or in relation to the non-fulfilment of any obligations under this User Agreement or arising out of violation of any applicable laws, regulations including but not limited to Intellectual Property Rights, payment of statutory dues and taxes, claim of libel, defamation, violation of rights of privacy or publicity, loss of service to other subscribers and infringement of intellectual property or other rights. This clause shall survive the expiry or termination of this User Agreement. We may terminate this User Agreement at any time, without notice or liability to KK CHICKEN.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
