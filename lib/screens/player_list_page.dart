import 'package:flutter/material.dart';
import 'package:playon/controllers/player_controller.dart';
import 'package:playon/models/player_model.dart';
import 'package:playon/widgets/bottom_list_widget.dart';
import 'package:playon/widgets/budget_widget.dart';
import 'package:playon/widgets/player_stat_widget.dart';
import 'package:playon/widgets/price_widget.dart';
import 'package:provider/provider.dart';

class PlayerListPage extends StatefulWidget {
  const PlayerListPage({Key? key}) : super(key: key);

  @override
  _PlayerListPageState createState() => _PlayerListPageState();
}

class _PlayerListPageState extends State<PlayerListPage> {
  Widget appBarTitle = const Text("Select player");
  late PlayerController _playerController;
  Icon actionIcon = const Icon(Icons.search);

  @override
  void initState() {
    super.initState();
    _playerController = Provider.of<PlayerController>(context, listen: false);
    _playerController.setData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerController>(
      builder: (context, myType, child) {
        return Scaffold(
          appBar: buildAppbar(myType),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: <Widget>[
                  budgetWidget(context),
                  Expanded(
                    child: ListView.builder(
                      itemCount: myType.filteredPlayerList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircleAvatar(),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        playerDetailWidget(
                                            myType.filteredPlayerList[index]),
                                        playerStatWidget(),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    priceWidget(context),
                                    Container(
                                      margin: const EdgeInsets.all(8.0),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                  bottomWidget()
                ],
              ),
              GestureDetector(
                onTap: () {
                  _playerController.filterAlphabetical();
                },
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.1),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    boxShadow: kElevationToShadow[3],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      Text(
                        "  SORT THE RESULT BY NAME",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      VerticalDivider(),
                      Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Row playerDetailWidget(Player player) {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.star_outline_rounded),
        ),
        Text(player.positionAbbreviation == PositionAbbreviation.CR
            ? "CR"
            : "DR"),
        Container(
          margin: const EdgeInsets.all(8),
          height: 15,
          width: 30,
          color: Colors.grey.shade400,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.18,
          child: Text(
            player.firstName!,
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppbar(PlayerController controller) {
    return AppBar(
      title: appBarTitle,
      actions: <Widget>[
        IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(
              () {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = const Icon(Icons.close);
                  appBarTitle = TextField(
                    onChanged: (val) {
                      controller.filterPlayers(val);
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  actionIcon = const Icon(Icons.search);
                  appBarTitle = const Text("Select player");
                }
              },
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.star_outline),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.filter_list),
        ),
      ],
    );
  }
}
