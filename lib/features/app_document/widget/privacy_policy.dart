import 'package:flutter/material.dart';

import '../../../core/core.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Privacy",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """This privacy policy sets out how KKChickens.com uses and protects any information that you give KKChickens.com when you use this website. KKChickens.com is committed to ensuring that your privacy is protected. Should we ask you to provide certain information by which you can be identified when using this website, then you can be assured that it will only be used in accordance with this privacy statement. KKChickens.com may change this policy from time to time by updating this page. You should check this page from time to time to ensure that you are happy with any changes.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Consent & terms of this Privacy Policy",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            """By using our platform (website, application or services), you have voluntarily agreed to consent & abide with this privacy policy. You have the option to disagree to abide by our privacy policy; if you choose disagree, you will not be able to access any portion of our platform or gain access to services provided on this platform.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "What we collect",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """We may collect the following information:""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """1. name\n
2. contact information including email address\n
3. demographic information such as postcode, preferences and interests\n
4. other information relevant to customer surveys and/or offers For the exhaustive list of cookies we collect see the List of cookies we collect section.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "What we do with the information we gather",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """We require this information to understand your needs and provide you with a better service, and in particular for the following reasons:\n
Internal record keeping.\n
We may use the information to improve our products and services.\n
We may periodically send promotional emails about new products, special offers or other information which we think you may find interesting using the email address which you have provided.\n
From time to time, we may also use your information to contact you for market research purposes. We may contact you by email, phone, fax or mail. We may use the information to customise the website according to your interests.\n
Without identifying you personally we may use your information to provide updates on our service offerings and promotional schemes through third party advertising partners (‘TPAP’). Our TPAP may use cookies on our website as well as third party websites and social media platforms to understand customer interests to provide updates on our latest service offerings and promotional schemes that are akin to your interests. Our TPAP provide you with complete control over ads experience and you can remove ads shown to you.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Security",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and secure the information we collect online.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "How we use cookies",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """A cookie is a small file which asks permission to be placed on your computer's hard drive. Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit a particular site. Cookies allow web applications to respond to you as an individual. The web application can tailor its operations to your needs, likes and dislikes by gathering and remembering information about your preferences.\n
We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page traffic and improve our website in order to tailor it to customer needs. We only use this information for statistical analysis purposes and then the data is removed from the system.\n
Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful and which you do not. A cookie in no way gives us access to your computer or any information about you, other than the data you choose to share with us. You can choose to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. This may prevent you from taking full advantage of the website.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Links to other websites",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """Our website may contain links to other websites of interest. However, once you have used these links to leave our site, you should note that we do not have any control over that other website. Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst visiting such sites and such sites are not governed by this privacy statement. You should exercise caution and look at the privacy statement applicable to the website in question.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Controlling your personal information",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """You may choose to restrict the collection or use of your personal information in the following ways:\n
whenever you are asked to fill in a form on the website, look for the box that you can click to indicate that you do not want the information to be used by anybody for direct marketing purposes\n
if you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time by writing to or emailing us at info@kkchickens.com\n
We will not sell, distribute or lease your personal information to third parties unless we have your permission or are required by law to do so. We may use your personal information to send you promotional information about third parties which we think you may find interesting if you tell us that you wish this to happen.\n
You may request details of personal information which we hold about you under the Data Protection Act 1998. A small fee will be payable. If you would like a copy of the information held on you please write to us at info@kkchickens.com\n
If you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible, at the above address. We will promptly correct any information found to be incorrect.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "How can a user opt not to disclose information with KK Chicken?",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """You have the option of not disclosing Your Sensitive Personal Data or Information to Us. You can also ask us to remove your data from our database by sending a mail to us at info@kkchickens.com. In the event that You choose not to disclose Sensitive Personal Information, you may not be able to access multiple areas of the Platform or awail our e-commerce facility / services provided on the Platform.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Marketing & promotional activity",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """K.K CHICKENS may use your information to provide you with better platform user-experience, send information on products and services which may be of interest to you, send via Short Messaging Services (SMS) marketing promotions, and share such personal information to our business partners on a need-to-know basis to render effective services for better customer experience.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "What is NDNC Policy?",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """By using the Platform, you hereby authorize Us to contact You via email, phone, or SMS (Short Message Service), other applications (android or apple) linked to phone number on the contact details so provided, to furnish You with information about Our Products, Services, product delivery, marketing promotions, & other allied services offered by K.K CHICKENS on its platform. This authorization is licit for the mentioned purposes irrespective of whether You are registered with the NDNC (National Do Not Call) registry.""",
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
            height: 12,
          ),
          Text(
            """You agree to indemnify and hold K.K CHICKENS harmless from:(i) any actions, claims, demands, suits, damages, losses, penalties, interest and other charges and expenses (including legal fees and other dispute resolution costs) made by any third party due to or arising out of any violation of the terms of this Policy; (ii)any acts or deeds, including for any non-compliance or violation, of any applicable law, rules, regulations on Your part; or (iii) for violations committed by You.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Governing Law & Severability",
            style: TextStyle(
                fontSize: 22,
                color: ColorTheme.darkGrey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            """The invalidity or unenforceability of any part of this Policy shall not prejudice or affect the validity or enforceability of the remainder of this Policy. This Policy has been prepared under the provisions of the Indian Information Technology Act, 2000 (“IT Act”) and its corresponding rules as enshrined under the Information Technology (Reasonable Security Practices and Procedures and Sensitive Personal Data or Information) Rules, 2011 (“IT Rules”) to monitor information (including sensitive personal data or information) collected, received, possessed, stored, dealt with, or handled by K.K CHICKENS.""",
            style: TextStyle(color: ColorTheme.blackColor, fontSize: 14),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
