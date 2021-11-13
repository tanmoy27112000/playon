import 'package:flutter/material.dart';

Column budgetWidget(BuildContext context) {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text("Budget"),
                Text("\$0.00M"),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: double.infinity,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      const Divider(),
    ],
  );
}
