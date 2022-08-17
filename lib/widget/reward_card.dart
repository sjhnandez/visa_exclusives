import 'package:flutter/material.dart';

class RewardCard extends StatelessWidget {
  final int points;
  final String imagePath;
  const RewardCard(this.points, this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        color: Colors.black.withOpacity(0.4),
        child: Column(
          children: [
            Text(
              '$points points',
              style: TextStyle(color: Color.fromRGBO(253, 205, 68, 1)),
            ),
            Expanded(
                child:
                    Image(image: AssetImage(imagePath), fit: BoxFit.fitHeight)),
          ],
        ),
      ),
    );
  }
}
