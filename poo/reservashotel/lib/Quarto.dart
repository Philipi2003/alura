abstract class Quarto{
  String tipo = '';
  double valorDiaria = 0;
  int _diariasReservados = 0;

  void reservar(int dias){
    _diariasReservados = dias;
  }

  // Adicione um método calcularValorTotal nas classes Quarto, QuartoMedio e QuartoLuxo. O método deve calcular o valor total da reserva com base em uma tarifa diária específica para cada tipo de quarto. Na main, crie exemplos de reservas para os três tipos de quarto e mostre o valor total calculado.
  void calcularValorTotal(){
    print("O valor total da reserva do quarto é R\$ ${_diariasReservados * valorDiaria}");
  }
}

class QuartoSimples extends Quarto{
  @override
  String tipo = 'Simples';
  
  @override
  double valorDiaria = 80;
}

class QuartoMedio extends Quarto{
  @override
  String tipo = 'Médio';

  @override
  double valorDiaria = 250;

  void servirCafe(){
    print("“Servindo café da manhã no quarto de $tipo");
  }
}

class QuartoLuxo extends Quarto{
  @override
  String tipo = 'Luxo';

  @override
  double valorDiaria = 1000;

  void servirCafe(){
    print("“Servindo café da manhã no quarto do $tipo");
  }

  void servicoDeQuarto(){
    print("Limpando o quarto de $tipo");
  }
}