import 'package:flutter/material.dart';
import 'package:playon/controllers/global_controller.dart';
import 'package:playon/controllers/team_controller.dart';
import 'package:playon/screens/home_page.dart';
import 'package:playon/screens/team_page.dart';
import 'package:playon/screens/unknown_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GlobalController(),
        ),
        ChangeNotifierProvider(
          create: (_) => TeamController(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (context) => const Homepage(),
            );
          }
          var uri = Uri.parse(settings.name!);
          if (uri.pathSegments.first == 'teampage') {
            return MaterialPageRoute(
              builder: (context) => const TeamPage(),
            );
          }
          return MaterialPageRoute(
            builder: (context) => const UnknownScreen(),
          );
        },
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        title: 'Material App',
        home: const Homepage(),
      ),
    );
  }
}
