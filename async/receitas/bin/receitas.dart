import 'package:http/http.dart';
import 'dart:convert';

void main(List<String> arguments) async {
  List<Map<String,dynamic>> recipes = await fetchRecipes('https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/recipes.json');
  List<String> filter = [
            "1 xícara de farinha de trigo",
            "1 xícara de leite",
            "1 ovo",
            "1 colher de sopa de óleo",
            "1 pitada de sal",
            "200g de frango desfiado",
            "1 cebola",
            "2 dentes de alho",
            "Molho de tomate a gosto",
            ];
  List<Map<String,dynamic>> recipesFiltered = filterRecipe(recipes,filter);
  print(recipesFiltered);
}

Future<List<Map<String,dynamic>>> fetchRecipes(String url) async {
  final uri = Uri.parse(url);
  final response = await get(uri);
  List<dynamic> jsonResponseList = json.decode(response.body);
  return jsonResponseList.map((e) => e as Map<String,dynamic>).toList();
}

List<Map<String,dynamic>> filterRecipe(List<Map<String,dynamic>> recipes,List<String> ingredients){
  return recipes.where((recipe){
    List<String> recipeIngredients = (recipe['ingredients'] as List<dynamic>).map((e) => e as String).toList();
    bool constainsAll = true;
    for (String ingredient in recipeIngredients){
      if (!ingredients.contains(ingredient)){
        constainsAll = false;
      }
    }
    return constainsAll;
  }).toList();
}