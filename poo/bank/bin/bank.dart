import '../lib/conta.dart';

void main(){
  ContaCorrente maria = ContaCorrente('Maria', 100);
  ContaPoupanca philipi = ContaPoupanca('Philipi', 80.5);
  ContaSalario catarina = ContaSalario("Catarina", 2500, "1111", "Brasil");
  philipi.imprimeSaldo();

  philipi.enviar(100);

  maria.imprimeSaldo();

  catarina.imprimeSaldo();
  catarina.imprimirDeposito();
}