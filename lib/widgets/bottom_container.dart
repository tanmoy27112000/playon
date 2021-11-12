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
              onSelected: (value) {
                if (value == 1) {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      TextEditingController _controller =
                          TextEditingController();
                      return SizedBox(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('RENAME TEAM${index + 1}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                hintText: "Type team name",
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    teamController.renameTeam(
                                        index, _controller.text);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Rename"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                          ),
                        ],
                      ));
                    },
                  );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text("Rename team"),
                  onTap: () {
                    // teamController.renameTeam(index);
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
