import 'package:flutter/material.dart';
import 'package:playon/apis/base_api.dart';
import 'package:playon/models/player_model.dart';
import 'package:playon/models/team_model.dart';

class GlobalController extends ChangeNotifier {
  bool _isLoading = true;

  late PlayerModel _playerModel;
  late TeamModel _teamModel;

  bool get isLoading => _isLoading;
  PlayerModel get playerModel => _playerModel;
  TeamModel get teamModel => _teamModel;

  loadingStatus(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getData() async {
    _playerModel = PlayerModel.fromJson(await getRequest("players"));
    _teamModel = TeamModel.fromJson(await getRequest("teams"));
    loadingStatus(false);
  }
}
