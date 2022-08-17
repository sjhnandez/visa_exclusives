import 'package:flutter/material.dart';
import 'package:flutter_visa_rewards/model/offer.dart';

class HomeDiscounts extends StatelessWidget {
  final Future<List<Offer>> offers;
  const HomeDiscounts(this.offers, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Offer>>(
      future: offers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data![index].description,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(snapshot.data![index].merchantName),
                    Text(snapshot.data![index].terms),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
