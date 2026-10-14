import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/home.dart';
import 'view/list_game.dart';
import 'view/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Steam Game Store',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0E141D),
        primaryColor: const Color(0xFF00D2FF),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/list': (context) => const ListGamePage(),
        '/detail': (context) {
          final gameId = ModalRoute.of(context)!.settings.arguments as int;
          return Detail(gameTerpilih: gameId);
        },
      },
    );
  }
}