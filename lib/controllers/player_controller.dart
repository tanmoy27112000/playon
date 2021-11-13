import 'package:flutter/material.dart';
import 'package:playon/controllers/global_controller.dart';
import 'package:playon/models/player_model.dart';
import 'package:provider/provider.dart';

class PlayerController extends ChangeNotifier {
  late GlobalController _globalController;
  List<Player> fullPlayerList = [];
  List<Player> filteredPlayerList = [];

  setData(context) {
    _globalController = Provider.of<GlobalController>(context, listen: false);
    fullPlayerList = _globalController.playerModel.players!;
    filteredPlayerList = fullPlayerList;
  }

  filterPlayers(String name) {
    filteredPlayerList = name == ""
        ? fullPlayerList
        : fullPlayerList
            .where((player) =>
                player.firstName!.toLowerCase().contains(name.toLowerCase()) ||
                player.firstName!.toLowerCase().contains(name.toLowerCase()))
            .toList();
    notifyListeners();
  }

  void filterAlphabetical() {
    //sort playerlist alphabetically
    filteredPlayerList = fullPlayerList;
    filteredPlayerList.sort((a, b) => a.firstName!.compareTo(b.firstName!));
    notifyListeners();
  }
}
