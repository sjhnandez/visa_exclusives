import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_visa_rewards/model/nav_button.dart';

class FooterNav extends StatelessWidget {
  final List<NavButton> buttons;
  final int selectedButton;
  FooterNav(this.buttons, this.selectedButton, {Key? key}) : super(key: key);

  final Color inactive = Color.fromRGBO(138, 132, 127, 1);
  final Color active = Color.fromRGBO(20, 52, 203, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttons
              .asMap()
              .entries
              .map((entry) => AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000)),
                      clipBehavior: Clip.hardEdge,
                      child: TextButton(
                          onPressed: entry.value.onClick,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: SvgPicture.asset(
                                  entry.value.svgPath,
                                  height: 25,
                                  width: 25,
                                  color: selectedButton == entry.key
                                      ? active
                                      : inactive,
                                ),
                              ),
                              Text(
                                entry.value.text,
                                style: TextStyle(
                                  color: selectedButton == entry.key
                                      ? active
                                      : inactive,
                                ),
                              )
                            ],
                          )),
                    ),
                  ))
              .toList()),
    );
  }
}
