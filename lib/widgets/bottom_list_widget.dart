import 'package:flutter/material.dart';

Container bottomWidget() {
  return Container(
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
              ),
              Text(
                "Hide list",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: const <Widget>[
              Text("TO PICK:"),
              Text(
                "1/6",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              VerticalDivider(),
              Text("AVERAGE:"),
              Text(
                "\$0.00M",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
