import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:dart_exceptions/api_key.dart';
import 'package:dart_exceptions/models/account.dart';

class AccountDioService {
  // final StreamController<String> _streamController = StreamController<String>();
  // Stream<String> get streamInfos => _streamController.stream;

  final dio = Dio();

  String url =
      "https://api.github.com/gists/413c0aefe6c6abc464581c29029c8ace";

  Future<List<Account>> getAll() async {
    Response response = await dio.get(url);
    // _streamController.add("${DateTime.now()} | Requisição de leitura.");

    Map<String, dynamic> mapResponse = response.data;
    List<dynamic> listDynamic =
        json.decode(mapResponse["files"]["accounts.json"]["content"]);

    List<Account> listAccounts = [];

    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;
      Account account = Account.fromMap(mapAccount);
      listAccounts.add(account);
    }

    return listAccounts;
  }

  addAccount(Account account) async {
    List<Account> listAccounts = await getAll();
    listAccounts.add(account);

    List<Map<String, dynamic>> listContent = [];
    for (Account account in listAccounts) {
      listContent.add(account.toMap());
    }

    String content = json.encode(listContent);

    Response response = await dio.post(
      url,
      options: Options(
        headers: {"Authorization": "Bearer $githubApiKey"},
      ),
      data: json.encode({
        "description": "account.json",
        "public": true,
        "files": {
          "accounts.json": {
            "content": content,
          }
        }
      }),
    );

    // if (response.statusCode.toString()[0] == "2") {
    //   _streamController.add(
    //       "${DateTime.now()} | Requisição adição bem sucedida (${account.name}).");
    // } else {
    //   _streamController
    //       .add("${DateTime.now()} | Requisição falhou (${account.name}).");
    // }
  }
}
