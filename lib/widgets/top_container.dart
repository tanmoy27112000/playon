import 'package:flutter/material.dart';

SizedBox topContainer(String name, int index) {
  return SizedBox(
    height: 50,
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 50,
          height: 100,
          child: Center(
            child: Text(
              "T${index + 1}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(name),
          ),
        )),
      ],
    ),
  );
}
