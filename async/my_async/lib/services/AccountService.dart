import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_async/api_key.dart';
import 'package:my_async/models/Account.dart';

class AccountService {

  StreamController<String> _streamController = StreamController<String>();

  Stream<String> get getStream => _streamController.stream;

  static String url = 'https://api.github.com/gists/01609ebfbf48328279d67a74de28ac81';

  Future<List<Account>> getAccounts() async {
    final Uri uri = Uri.parse(url);
    final Response res = await get(uri);
    final Map<String,dynamic> body = jsonDecode(res.body);
    final List<dynamic> content = jsonDecode(body['files']['accounts.json']['content']);
    _streamController.add("${DateTime.now()} | Leitura realizada");
    return content.map((e) => Account.fromMap(e)).toList();
  }
 
  Future<void> newAccount(Account newItem) async {
    final Uri uri = Uri.parse(url);
    List<Account> accounts = await getAccounts();
    accounts.add(newItem);

    List<Map<String,dynamic>> accountsMap = accounts.map((e) => e.toMap()).toList();
    String content = jsonEncode(accountsMap); 

    final Response res = await post(
      uri,
      headers: {
        'Authorization': "Bearer $gistKey"
      },
      body: jsonEncode({
        'description':'An update',
        'files':{
          'accounts.json': {
            'content': content
          }
        }
      })
    );
    _streamController.add("${DateTime.now()} | Gravação de ${newItem.name} no sistema");
  }

  Future<Account?> getAccountById(String id) async {
    Uri uri = Uri.parse(url);

    List<Account> accounts = await getAccounts();

    Account? idsAccount = accounts.where((e) => e.id == id).singleOrNull;

    if (idsAccount == null) {
      _streamController.add("Conta com id $id não foi encontrada");
      return null;
    }

    _streamController.add("Conta com id $id foi encontrada");
    return idsAccount;
  }

  Future<void> updateAccount(String id, Map<String, dynamic> map) async {
    Uri uri = Uri.parse(url);

    List<Account> accounts = await getAccounts();
    Account? idsAccount = accounts.where((e) => e.id == id).singleOrNull;

    if (idsAccount == null){
      return;
    }

    Account updatedAccount = idsAccount.copyWith(id: map['id'],name: map['name'],lastName: map['lastName'],balance: map['balance']);

    List<Account> updatedAccounts = accounts.map((e) => e.id == id ? updatedAccount : e).toList();

    List<Map<String,dynamic>> accountsMap = updatedAccounts.map((e) => e.toMap()).toList();

    final Response res = await post(
      uri,
      headers: {
        'Authorization': "Bearer $gistKey"
      },
      body: jsonEncode({
        'description':'An update',
        'files':{
          'accounts.json': {
            'content': jsonEncode(accountsMap)
          }
        }
      })
    );
    if (res.statusCode < 200 || res.statusCode > 299) {
      _streamController.add("Algo de errado aconteceu no update da conta de id $id");
      return;
    }
    _streamController.add("A atualização da conta de id $id ocorreu com sucesso");
  }

  Future<void> deleteAccount(String id) async {
    Uri uri = Uri.parse(url);

    List<Account> accounts = await getAccounts();
    Account? idsAccount = accounts.where((e) => e.id == id).singleOrNull;

    if (idsAccount == null){
      return;
    }

    accounts.remove(idsAccount);

    List<Map<String,dynamic>> accountsMap = accounts.map((e) => e.toMap()).toList();

    final Response res = await post(
      uri,
      headers: {
        'Authorization': "Bearer $gistKey"
      },
      body: jsonEncode({
        'description':'An update',
        'files':{
          'accounts.json': {
            'content': jsonEncode(accountsMap)
          }
        }
      })
    );

    if (res.statusCode < 200 || res.statusCode > 299) {
      _streamController.add("Algo de errado aconteceu na remoção da conta de id $id");
      return;
    }
    _streamController.add("Conta com id $id removida com sucesso");

  }
}