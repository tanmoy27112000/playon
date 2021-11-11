import 'package:flutter/material.dart';
import 'package:playon/controllers/team_controller.dart';

SizedBox bottomContainer(
  TeamController teamController,
  context,
  int index,
) {
  return SizedBox(
    height: 60,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
          ),
        ),
        Container(
          color: Colors.white,
          width: 80,
          child: Center(
            child: PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text("Rename team"),
                  onTap: () {
                    teamController.renameTeam(index);
                  },
                  value: 1,
                ),
                PopupMenuItem(
                  child: const Text("Recreate"),
                  onTap: () {
                    teamController.recreateTeam(index);
                  },
                  value: 2,
                ),
                PopupMenuItem(
                  child: const Text("Replicate"),
                  onTap: () {
                    teamController.duplicateTeam(
                        teamController.teamList[index], context);
                  },
                  value: 3,
                ),
                PopupMenuItem(
                  child: const Text("Delete"),
                  onTap: () {
                    teamController.deleteTeam(index);
                  },
                  value: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
