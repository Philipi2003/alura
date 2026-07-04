import 'dart:convert';
import 'package:http/http.dart';

const gistKey = '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';

const gistBaseUrl = 'https://api.github.com/gists/8e2f31f809a18b0b7d138406d748f33c';

void main() async {

  print(await getProducts());
}

Future<List<Map<String,dynamic>>> getProducts() async {
  Uri uri = Uri.parse(gistBaseUrl);

  final response = await get(uri);

  List<dynamic> content = extractContent(response);

  return content.map((e) => e as Map<String,dynamic>).toList();
}

List<dynamic> extractContent(Response response){
  
  final responseMap = jsonDecode(response.body);

  return jsonDecode(responseMap['files']['produtos.json']['content']);

}

Future<void> insertProduct(int id, String name, double price) async{
  Uri uri = Uri.parse(gistBaseUrl);

  List<Map<String,dynamic>> produtos = await getProducts();

  produtos.add({"id":id,"name":name,"price":price});

  String requestData = jsonEncode({
    "description": "Novo produto $name",
    "files": {
      "produtos.json": {
        "content": jsonEncode(produtos)
      }
    }
  });

  await post(uri,
    headers: {
      "Authorization": "Bearer $gistKey"
    },
    body: requestData
    );

  print(await getProducts());
}