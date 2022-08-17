import 'package:flutter/material.dart';
import 'package:visa_exclusives/widget/cashback_progress.dart';

class _Challenge {
  final int points;
  final String description;
  const _Challenge(this.points, this.description);
}

class HomeHome extends StatelessWidget {
  const HomeHome({Key? key}) : super(key: key);

  final List<_Challenge> _challenges = const [
    _Challenge(123, "Lorem ipsum dolor sit amet"),
    _Challenge(123, "Lorem ipsum dolor sit amet"),
    _Challenge(123, "Lorem ipsum dolor sit amet"),
    _Challenge(123, "Lorem ipsum dolor sit amet"),
    _Challenge(123, "Lorem ipsum dolor sit amet"),
    _Challenge(123, "Lorem ipsum dolor sit amet"),
    _Challenge(123, "Lorem ipsum dolor sit amet"),
    _Challenge(123, "Lorem ipsum dolor sit amet"),
    _Challenge(123, "Lorem ipsum dolor sit amet")
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(children: [
        Material(
          color: Theme.of(context).primaryColor,
          child: const TabBar(
            tabs: [
              Tab(
                text: 'Dailies',
              ),
              Tab(
                text: 'Weeklies',
              ),
              Tab(
                text: 'Monthlies',
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _challenges[index].description,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("${_challenges[index].points} points"),
                        ],
                      ),
                    ),
                  ),
                  itemCount: _challenges.length,
                ),
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _challenges[index].description,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("${_challenges[index].points} points"),
                        ],
                      ),
                    ),
                  ),
                  itemCount: _challenges.length,
                ),
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _challenges[index].description,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("${_challenges[index].points} points"),
                        ],
                      ),
                    ),
                  ),
                  itemCount: _challenges.length,
                ),
              ],
            ),
          ),
        ),
        CashbackProgress(42.0, 60.0),
      ]),
    );
  }
}
