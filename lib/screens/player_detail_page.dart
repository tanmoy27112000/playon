import 'package:flutter/material.dart';
import 'package:playon/controllers/team_controller.dart';
import 'package:playon/widgets/player_detail_widget.dart';
import 'package:provider/provider.dart';

class PlayerDetailPage extends StatefulWidget {
  const PlayerDetailPage({Key? key}) : super(key: key);

  @override
  _PlayerDetailPageState createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  late TeamController _teamController;

  @override
  void initState() {
    _teamController = Provider.of<TeamController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0600EF),
            Color(0xFF6965DF),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                playerDetail(context, _teamController.selectedPlayer!),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Player status",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 5,
                            ),
                          ),
                          Text(
                            "Injured",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                streakWidget(),
                season(),
                gameWeek(),
                sentiment(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding season() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "Season",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Row(
            children: const <Widget>[
              RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.arrow_left_rounded,
                  color: Colors.green,
                ),
              ),
              Text(
                "\$00.0M",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding sentiment() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "Sentiment",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.26,
                  color: Colors.grey.shade200,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 32),
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.10,
                  color: Colors.green,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.18),
                  height: 10,
                  width: 5,
                  color: Colors.green,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding gameWeek() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "Gameweek",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Row(
            children: const <Widget>[
              RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.arrow_left_rounded,
                  color: Colors.green,
                ),
              ),
              Text(
                "\$00.0M",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding streakWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "Streak",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Row(
            children: <Widget>[
              ...[1, 2]
                  .map(
                    (e) => Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e == 1 ? "Q" : "R",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ...[1, 2, 3]
                            .map(
                              (e) => Container(
                                margin: const EdgeInsets.all(2),
                                height: 20,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: e == 1 ? Colors.green : Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  )
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}
