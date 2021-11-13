import 'package:flutter/material.dart';

Padding playerStatWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      children: <Widget>[
        ...[1, 2]
            .map(
              (f) => Column(
                children: [
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          f == 1 ? "Q" : "R",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ...[1, 2, 3]
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.all(2),
                              height: 15,
                              width: 5,
                              decoration: BoxDecoration(
                                color: e == 1
                                    ? Colors.green
                                    : Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                  Text(
                    f == 1 ? "99.9%" : "0000 pts",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            )
            .toList()
      ],
    ),
  );
}
