import 'package:flutter/material.dart';
import 'package:playon/models/player_model.dart' as player;

Column playerDetail(BuildContext context, player.Player player) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            color: Colors.white,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 50,
            child: Image.asset(
              'assets/logo.png',
              height: 240,
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width / 3,
            color: Colors.grey,
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            height: 40,
            width: 40,
            color: Colors.white,
          ),
        ],
      ),
      Text(
        player.firstName!,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          player.lastName!,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        height: 25,
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Text(
            "DRIVER",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "\$0.00M",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.star_border_rounded,
                color: Colors.white,
              ),
            ),
            Text(
              "Add Favourite",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
