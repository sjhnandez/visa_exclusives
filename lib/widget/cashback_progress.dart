import 'package:flutter/material.dart';

class CashbackProgress extends StatelessWidget {
  final double currentValue;
  final double maxValue;

  const CashbackProgress(this.currentValue, this.maxValue, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Text('Cashback'),
          Row(
            children: [
              Text(currentValue.toString()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(20, 52, 203, 1)),
                    backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                    value: currentValue / maxValue,
                    minHeight: 4,
                  ),
                ),
              ),
              Text(maxValue.toString())
            ],
          ),
          Text('8 more days to increase limit to \$75')
        ]),
      ),
    );
  }
}
