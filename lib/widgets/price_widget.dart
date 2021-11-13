import 'package:flutter/material.dart';

Container priceWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const Text(
            "\$0.00M",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: const <Widget>[
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.20,
                  color: Colors.grey.shade200,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 32),
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.05,
                  color: Colors.green,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.13),
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
  );
}
