import 'dart:async';
import 'dart:io';
import 'package:my_async/models/Account.dart';
import 'package:my_async/services/AccountService.dart';

class AccountScreen {
  AccountService service = AccountService();

  StreamSubscription initializeStream(){
    return service.getStream.listen((event) => print(event));
  }

  Future<void> runBot() async{
    print("Olá eu sou o manolo");
    print("Em que posso ajudar?");

    bool isRunning = true;
    while(isRunning){
      print("Escolha uma opção:");
      print("1 - Listar contas");
      print("2 - Adicionar exemplo");
      print("3 - Sair");
      String? input = stdin.readLineSync();
      switch(input){
        case "1":
          await _getAllAccounts();
          break;
        case "2":
          await _insertExample();
          break;
        case "3":
          isRunning = false;
          print("Até logo");
          break;
        default:
          print("Comando inválido");
      }
    }
  }

  Future<void> _getAllAccounts() async{
    try{
      print(await service.getAccounts());
    } on Exception {
      print("Erro ao realizar a requisição");
    }
  }

  Future<void> _insertExample() async {
    await service.newAccount(Account(
      id: "007", 
      name: "James", 
      lastName: "Bound", 
      balance: 100000));
  }

}