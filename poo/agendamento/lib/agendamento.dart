abstract class Agendamento {
  calculaDuracaoConsulta();

  verificaDisponibilidade();
}

// Implemente a interface Agendamento na classe Medico. A classe Medico deve fornecer uma implementação concreta dos métodos calculaDuracaoConsulta() e verificaDisponibilidade(). Considere que, para médicos, a duração padrão da consulta é de 30 minutos, e a disponibilidade é verificada com base em um calendário de agendamentos previamente existente.

class Medico implements Agendamento{
  int _duracao = 30;

  @override
  calculaDuracaoConsulta() {
    return _duracao;
  }
  @override
  verificaDisponibilidade() {
    // TODO: implement verificaDisponibilidade
    throw UnimplementedError();
  }
}

class Dentista implements Agendamento{
  int _duracao = 45;
  int _intervalo = 15;

  @override
  calculaDuracaoConsulta() {
    // TODO: implement calculaDuracaoConsulta
    throw UnimplementedError();
  }
  @override
  verificaDisponibilidade() {
    // TODO: implement verificaDisponibilidade
    throw UnimplementedError();
  }
}

// Crie uma classe chamada GerenciadorDeAgendamentos que contenha uma lista de objetos que implementam a interface Agendamento. Adicione métodos para adicionar novos profissionais à lista e para calcular e exibir a duração das consultas e a disponibilidade de todos os profissionais cadastrados no sistema.

class GerenciadorDeAgendamentos{
  List<Agendamento> agendamentos = [];

  void adicionarAgendamento(){
    
  }
}