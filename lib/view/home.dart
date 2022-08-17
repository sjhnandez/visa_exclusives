import 'package:flutter/material.dart';
import 'package:visa_exclusives/widget/header.dart';
import 'package:visa_exclusives/widget/footer_nav.dart';
import 'package:visa_exclusives/model/nav_button.dart';
import 'package:visa_exclusives/view/home_home.dart';
import 'package:visa_exclusives/view/home_discounts.dart';
import 'package:visa_exclusives/helpers/api/api_client.dart';
import 'package:visa_exclusives/model/offer.dart';
import 'package:visa_exclusives/view/home_rewards.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  final List<Map<String, String>> navTabs = const [
    {'svg_path': 'assets/images/Goal.svg', 'text': 'Challenges'},
    {'svg_path': 'assets/images/Offer.svg', 'text': 'Offers'},
    {'svg_path': 'assets/images/Gift.svg', 'text': 'Rewards'},
    {'svg_path': 'assets/images/More.svg', 'text': 'More'},
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NavButton> get navButtons {
    return widget.navTabs
        .asMap()
        .entries
        .map((entry) => NavButton(
            entry.value['svg_path'].toString(),
            entry.value['text'].toString(),
            () => setState(() {
                  selectedTab = entry.key;
                })))
        .toList();
  }

  int selectedTab = 0;

  void setTab(int num) {
    setState(() {
      selectedTab = num;
    });
  }

  late Future<List<Offer>> offers;

  @override
  void initState() {
    super.initState();
    offers = ApiClient.getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(9, 29, 73, 1),
          toolbarHeight: 80,
          flexibleSpace: Header()),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            child: (() {
              switch (selectedTab) {
                case 0:
                  return HomeHome();
                case 1:
                  return HomeDiscounts(offers);
                case 2:
                  return HomeRewards();
              }
            })(),
          ),
        ),
        FooterNav(navButtons, selectedTab)
      ]),
    );
  }
}
