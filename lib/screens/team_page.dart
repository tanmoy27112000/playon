import 'package:flutter/material.dart';
import 'package:playon/controllers/team_controller.dart';
import 'package:playon/widgets/team_card.dart';
import 'package:provider/provider.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TeamController>(
      builder: (context, myType, child) {
        return PageView.builder(
          itemCount:
              myType.teamList.length + 1 < 3 ? myType.teamList.length + 1 : 3,
          itemBuilder: (context, index) {
            return index < myType.teamList.length
                ? TeamCard(myType, index)
                : Scaffold(
                    body: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          myType.generateTeam(context);
                        },
                        child: Text("Create Team ${index + 1}"),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
