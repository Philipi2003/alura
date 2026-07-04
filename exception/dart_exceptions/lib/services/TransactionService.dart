import 'dart:convert';

import 'package:dart_exceptions/models/transaction.dart';
import 'package:dart_exceptions/api_key.dart';
import 'package:dart_exceptions/services/account_service.dart';
import 'package:dart_exceptions/models/Account.dart';

import 'package:http/http.dart';

class TransactionService {
  String url =
      "https://api.github.com.br/gists/413c0aefe6c6abc464581c29029c8ace";
  AccountService _accountService = AccountService();

  Future<List<Transaction>> getAll() async {
    Response response = await get(Uri.parse(url));
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    List<dynamic> content = responseMap['files']['transactions.json']['content'];
    return content.map((e) => Transaction.fromJson(e)).toList();
  }

  Future<void> addTransaction(Transaction newValue) async {
    List<Transaction> transactions = await getAll();

    transactions.add(newValue);

    List<Map<String,dynamic>> mapList = transactions.map((e) => e.toMap()).toList();

    String content = jsonEncode(mapList);

    Response response = await save(content);
  }

  Future<Response> save(String content) async {
    return await post(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $githubApiKey"},
      body: json.encode({
        "description": "account.json",
        "public": true,
        "files": {
          "transactions.json": {
            "content": content,
          }
        }
      }),
    );
  }

  Future<Transaction?> makeTransaction({
    required String idSender,
    required String idReceiver,
    required double amount
  }) async{
    List<Account> allAccounts = await _accountService.getAll();

    bool isInvalidSender = allAccounts.where(((e) => e.id == idSender)).isEmpty;
    bool isInvalidReceiver = allAccounts.where(((e) => e.id == idReceiver)).isEmpty;
    if (isInvalidSender) return null;
    if (isInvalidReceiver) return null;
    
    Account? sender = allAccounts.firstWhere((e) => e.id == idSender);
    Account? receiver = allAccounts.firstWhere((e) => e.id == idReceiver);

    

  }
}