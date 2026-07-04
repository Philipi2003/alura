import '../lib/Funcionario.dart';

void main(List<String> arguments) {
  Analista joao = Analista("João");
  Gerente maria = Gerente("Maria");
  Diretor giovana = Diretor("Giovana");

  joao.exibirSalario();
  maria.exibirSalario();
  giovana.exibirSalario();

}
