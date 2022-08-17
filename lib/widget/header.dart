import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);
  final Widget svg = SvgPicture.asset(
    'assets/images/VisaWhite.svg',
    fit: BoxFit.contain,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(margin: const EdgeInsets.only(right: 10), child: svg),
            const FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                'Exclusives',
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
