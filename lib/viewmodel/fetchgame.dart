import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../model/game.dart';

Future<List<Game>> fetchGames() async {
  try {
    final response = await http
        .get(Uri.parse('https://www.freetogame.com/api/games'))
        .timeout(const Duration(seconds: 4));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Game.fromJson(item)).toList();
    }
  } catch (_) {
    // Fallback otomatis ke data JSON lokal kalau offline/koneksi lambat
  }

  final String localData = await rootBundle.loadString('assets/data/games.json');
  final List<dynamic> jsonData = json.decode(localData);
  return jsonData.map((item) => Game.fromJson(item)).toList();
}

Future<Map<String, dynamic>> fetchDataFromAPI(int idGame) async {
  try {
    final response = await http
        .get(Uri.parse('https://www.freetogame.com/api/game?id=$idGame'))
        .timeout(const Duration(seconds: 4));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData != null && jsonData is Map<String, dynamic>) {
        return jsonData;
      }
    }
  } catch (_) {
    // Fallback otomatis ke data JSON lokal
  }

  final String localData = await rootBundle.loadString('assets/data/games.json');
  final List<dynamic> jsonData = json.decode(localData);
  final gameData = jsonData.firstWhere(
    (element) => element['id'] == idGame,
    orElse: () => jsonData.first,
  );
  return Map<String, dynamic>.from(gameData);
}