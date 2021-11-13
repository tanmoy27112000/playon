import 'package:flutter/material.dart';
import 'package:playon/controllers/global_controller.dart';
import 'package:playon/controllers/team_controller.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late GlobalController _globalController;

  @override
  void initState() {
    _globalController = Provider.of<GlobalController>(context, listen: false);
    _globalController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalController>(
      builder: (context, myType, child) {
        return Scaffold(
          body: Center(
              child: myType.isLoading
                  ? const CircularProgressIndicator()
                  : Consumer<TeamController>(
                      builder: (context, teamController, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                teamController.generateTeam(context);
                                Navigator.pushNamed(
                                  context,
                                  'teampage',
                                );
                              },
                              child: const Text("Create Team 1"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  'playerlist',
                                );
                              },
                              child: const Text("Check player list"),
                            ),
                          ],
                        );
                      },
                    )),
        );
      },
    );
  }
}
