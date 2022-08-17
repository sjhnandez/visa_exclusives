import 'package:flutter/material.dart';
import 'package:visa_exclusives/view/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visa_exclusives/helpers/api/api_client.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Visa Exclusives',
        home: const Home(),
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(9, 29, 73, 1),
          textTheme: (GoogleFonts.nunitoSansTextTheme()),
        ));
  }
}
