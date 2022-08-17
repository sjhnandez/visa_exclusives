import 'package:flutter/material.dart';
import 'package:flutter_visa_rewards/widget/cashback_progress.dart';
import 'package:flutter_visa_rewards/widget/reward_card.dart';

class _Reward {
  final String imagePath;
  final int points;
  const _Reward(this.imagePath, this.points);
}

class HomeRewards extends StatelessWidget {
  final int earnedPoints = 4567;
  final int thisMonth = 240;
  final double cashbackProgress = 42.0;
  final double cashbackLimit = 60.0;
  final List<_Reward> _rewards = const [
    _Reward('assets/images/offer1.png', 1000),
    _Reward('assets/images/offer2.png', 2000),
    _Reward('assets/images/offer3.png', 3000),
  ];

  const HomeRewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  'Points Earned',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Row(
                  children: [
                    Text('Total Points:     '),
                    Text(
                      earnedPoints.toString(),
                      style: TextStyle(
                          color: Color.fromRGBO(253, 205, 68, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('This Month:      '),
                    Text(
                      thisMonth.toString(),
                      style: TextStyle(
                          color: Color.fromRGBO(253, 205, 68, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                )
              ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/Rewards_Background.jpeg'),
                        fit: BoxFit.cover)),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _rewards
                        .map((reward) => Expanded(
                            child: RewardCard(reward.points, reward.imagePath)))
                        .toList()),
              ),
            ),
          ),
          CashbackProgress(cashbackProgress, cashbackLimit)
        ],
      ),
    );
  }
}
