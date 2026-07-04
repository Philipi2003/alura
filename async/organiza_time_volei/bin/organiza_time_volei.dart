import 'dart:convert';

import 'package:organiza_time_volei/organiza_time_volei.dart' as organiza_time_volei;
import 'package:http/http.dart';

void main(List<String> arguments) async {
  String url = 'https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/players.json';
  List<Map<String,dynamic>> players = await fetchPlayers(url);

  
}

Future<List<Map<String,dynamic>>> fetchPlayers(String url) async {
  Uri uri = Uri.parse(url);
  Response response = await get(uri);
  List<dynamic> jsonResponse = jsonDecode(response.body);
  return jsonResponse.map((e)=>e as Map<String,dynamic>).toList();
}