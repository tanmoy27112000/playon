import 'dart:math';

import 'package:flutter/material.dart';
import 'package:playon/controllers/global_controller.dart';
import 'package:playon/models/player_model.dart';
import 'package:provider/provider.dart';

class TeamController extends ChangeNotifier {
  bool _isLoading = true;
  List<UserTeam> teamList = [];
  late GlobalController globalController;
  Player? selectedPlayer;

  bool get isLoading => _isLoading;

  loadingStatus(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  setSelectedPlayer(Player player) {
    selectedPlayer = player;
    notifyListeners();
  }

  generateTeam(context) {
    globalController = Provider.of<GlobalController>(context, listen: false);
    List<Player> playerList = createTeam();
    while (playerList.length < 6) {
      playerList = createTeam();
    }
    // ignore: avoid_print
    print("=======team added========");
    teamList.add(
      UserTeam(name: "Team name", playerList: playerList),
    );
    notifyListeners();
  }

  duplicateTeam(UserTeam team, BuildContext context) {
    if (teamList.length != 3) {
      teamList.add(
        UserTeam(
          name: team.name,
          playerList: team.playerList,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You can't add more than 3 teams"),
        ),
      );
    }
    notifyListeners();
  }

  void renameTeam(int index, String text) {
    teamList[index].name = text;
    notifyListeners();
  }

  void recreateTeam(int index) {
    List<Player> playerList = createTeam();
    while (playerList.length < 6) {
      playerList = createTeam();
    }
    // ignore: avoid_print
    print("=======team recreated========");
    teamList[index] = UserTeam(name: "Team name", playerList: playerList);
    notifyListeners();
  }

  void deleteTeam(int index) {
    teamList.removeAt(index);
    notifyListeners();
  }

  createTeam() {
    double budget = 100;
    int loopTime = 0;
    List<Player> playerList = [];
    List drivers = globalController.playerModel.players!
        .where((element) => element.position == Position.DRIVER)
        .toList();
    List constructor = globalController.playerModel.players!
        .where((element) => element.position == Position.CONSTRUCTOR)
        .toList();

    while (playerList.length != 6) {
      Player _player;
      if (playerList.length < 5) {
        _player = drivers[Random().nextInt(drivers.length)];
        if (_player.price! < budget) {
          playerList.add(_player);
          budget = budget - _player.price!;
        }
      } else {
        _player = constructor[Random().nextInt(constructor.length)];
        if (_player.price! < budget) {
          playerList.add(_player);
          budget = budget - _player.price!;
        }
      }
      loopTime++;
      if (loopTime > 100) {
        print("infinite loop");
        break;
      }
    }
    return playerList;
  }
}

class UserTeam {
  String name;
  List<Player> playerList;

  UserTeam({required this.name, required this.playerList});
}
