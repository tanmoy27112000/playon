import 'package:flutter/material.dart';
import 'package:playon/controllers/team_controller.dart';
import 'package:playon/models/player_model.dart' as player;
import 'package:playon/widgets/background_widget.dart';
import 'package:playon/widgets/bottom_container.dart';
import 'package:playon/widgets/top_container.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TeamCard extends StatelessWidget {
  TeamController teamController;
  UserTeam? userTeam;
  int index;
  TeamCard(this.teamController, this.index, {Key? key}) : super(key: key) {
    userTeam = teamController.teamList[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff242C35),
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  topContainer(userTeam!.name, index),
                  teamContainer(context),
                  bottomContainer(teamController, context, index),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded teamContainer(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...userTeam!.playerList
                  .sublist(0, 3)
                  .map((player) => playerCard(player, context))
                  .toList()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...userTeam!.playerList
                  .sublist(3, 5)
                  .map((player) => playerCard(player, context))
                  .toList()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...[userTeam!.playerList.last]
                  .map((player) => playerCard(player, context))
                  .toList()
            ],
          ),
        ],
      ),
    );
  }

  playerCard(player.Player playerItem, BuildContext context) {
    return InkWell(
      onTap: () {
        TeamController teamController =
            Provider.of<TeamController>(context, listen: false);
        teamController.setSelectedPlayer(playerItem);
        Navigator.pushNamed(context, '/player');
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 150,
            width: MediaQuery.of(context).size.width * 0.28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                ClipPath(
                  clipper: TriangleClipper(),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Container(
                      color: const Color(0xff95A4BC),
                      height: 50,
                      width: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: playerItem.position == player.Position.CONSTRUCTOR
                          ? 16
                          : 0.0,
                      bottom: 4),
                  child: FittedBox(
                    child: Text(
                        "${playerItem.firstName!} ${playerItem.lastName!}"),
                  ),
                ),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.28,
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Text(
                      playerItem.positionAbbreviation ==
                              player.PositionAbbreviation.CR
                          ? "CR"
                          : "DR",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      children: const <Widget>[
                        Text("\$00.0M"),
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
                          ),
                        ),
                      ],
                    ),
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
          ),
          playerItem.position == player.Position.CONSTRUCTOR
              ? Container(
                  margin: const EdgeInsets.only(right: 15, top: 25),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(right: 15),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
