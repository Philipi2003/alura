import 'package:reservashotel/Quarto.dart';

import '../lib/Cliente.dart';

void main(List<String> arguments) {
  /*
    Também, faça a instância da classe com um objeto, por exemplo, o cliente Joaquim.
  */
  // Cliente joaquim = Cliente("Joaquim");

  // joaquim.listarReservas();

  // joaquim.adicionarQuarto(3);
  // joaquim.adicionarQuarto(5);
  // joaquim.adicionarQuarto(9);

  // joaquim.cancelarReserva(4);
  // joaquim.cancelarReserva(5);

  QuartoSimples simples = QuartoSimples();
  QuartoMedio medio = QuartoMedio();
  QuartoLuxo luxo = QuartoLuxo();

  simples.reservar(4);
  medio.reservar(2);
  luxo.reservar(6);

  luxo.calcularValorTotal();
  medio.calcularValorTotal();
  simples.calcularValorTotal();
}
