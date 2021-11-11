import 'package:flutter/material.dart';
import 'package:playon/screens/home_page.dart';
import 'package:playon/screens/unknown_screen.dart';

routeGen() {
  (settings) {
    if (settings.name == '/') {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => const Homepage(),
      );
    }
    var uri = Uri.parse(settings.name!);
    if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'details') {
      // var id = uri.pathSegments[1];
      // return MaterialPageRoute(
      //     builder: (context) => DetailScreen(id: id));
    }

    return MaterialPageRoute(builder: (context) => const UnknownScreen());
  };
}
