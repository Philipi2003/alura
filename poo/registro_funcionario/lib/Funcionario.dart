// Primeiro, crie uma classe abstrata funcionario com os atributos nome de funcionário(a) e um double “salário base” inicializado em 3000 reais, e também um método calcularSalario. Em seguida, implemente, a partir de funcionario, as classes analista, gerente e diretor; sobrescreva o método calcularSalario nelas com os seguintes valores:
abstract class Funcionario {
  String nome;
  double salarioBase = 3000;
  String tipo = '';

  Funcionario(this.nome);

  double calcularSalario();

  void exibirSalario(){
    print("Salário do $tipo $nome: R\$ ${calcularSalario()}");
  }
}


class Analista extends Funcionario{
  @override
  String tipo = 'Analista';
  Analista(super.nome);

  // analista: salário base = salário base + salário base multiplicado por 1.2;
  @override
  double calcularSalario(){
    return salarioBase = salarioBase * (1 + 1.2);
  }
}

class Gerente extends Funcionario{
  @override
  String tipo = 'Gerente';
  Gerente(super.nome);

  // gerente: salário base = salário base + salário base multiplicado por 1.5;
  @override
  double calcularSalario(){
    return salarioBase = salarioBase * (1 + 1.5);
  }
}

class Diretor extends Funcionario{
  @override
  String tipo = 'Diretor';
  Diretor(super.nome);

  // diretor: salário base = salário base + salário base multiplicado por 2.0.
  @override
  double calcularSalario(){
    return salarioBase = salarioBase * (1 + 2);
  }
}