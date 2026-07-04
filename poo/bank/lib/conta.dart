abstract class Conta {
  String titular;
  double _saldo;

  Conta(this.titular, this._saldo);

  void receber(double valor) {
    _saldo += valor;
    imprimeSaldo();
  }

  void enviar(double valor) {
    if (_saldo >= valor) {
      _saldo -= valor;
      imprimeSaldo();
    } else {
      print("Saldo insuficiente");
    }
  }

  void imprimeSaldo() {
    print("O saldo atual de $titular, é: R\$$_saldo");
  }
}

class ContaCorrente extends Conta{
  double emprestimo = 300;
  ContaCorrente(super.titular, super._saldo);

  @override
  void enviar(double valor){
    try{
      if (_saldo + emprestimo >= valor) {
        _saldo -= valor;
        print("Envio realizado com sucesso");
        imprimeSaldo();
      } else {
        print("Saldo insuficiente");
      }
    }catch(e){
      print(e);
      print("Falha no envio");
    }
    
  }
}

class ContaPoupanca extends Conta{
  double rendimento = 0.05;
  ContaPoupanca(super.titular, super._saldo);

  void calculaRendimento(){
    try{
      _saldo *= (1+rendimento);
      print("Rendimento efetuado com sucesso");
      imprimeSaldo();
    } catch (e){
      print(e);
      print("Erro no processamento do rendimento");
    }
  }
}

/*
Variável com o CNPJ da empresa que emprega o(a) titular da conta;
Variável do nome da empresa;
Um método (função print) que diz algo como: “O salário da $empresa, de CNPJ X no valor de R$xx.x, foi depositado!”
 */
class ContaSalario extends Conta{
  String cnpj;
  String empresa;

  ContaSalario(super.titular,super._saldo, this.cnpj, this.empresa);

  void imprimirDeposito(){
    print("O salário da $empresa, de CNPJ $cnpj no valor de R\$2000, foi depositado!");
  }
}