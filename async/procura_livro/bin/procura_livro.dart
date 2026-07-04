import 'dart:convert';

import 'package:procura_livro/procura_livro.dart' as procura_livro;
import 'package:http/http.dart';

void main(List<String> arguments) async {
  String url = 'https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/books.json';
  String autor = "a";

  List<Map<String,dynamic>> books = await fetchBooks(url);

  List<Map<String,dynamic>> livrosFiltradosPorAutor = filtrarPorAutor(books, autor);

  print("Os livros do autor $autor são:");
  livrosFiltradosPorAutor.forEach((e) => print("* ${e['title']}"));

}

Future<List<Map<String,dynamic>>> fetchBooks(String url) async{
  Uri uri = Uri.parse(url);

  List<dynamic> response = jsonDecode((await get(uri)).body); 

  return response.map((e) => e as Map<String,dynamic>).toList();
}

List<Map<String,dynamic>> filtrarPorAutor(List<Map<String,dynamic>> books, String autor){
  return books.where((e) => e['author'] == autor).toList();
}