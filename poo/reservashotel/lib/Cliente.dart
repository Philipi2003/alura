

class Cliente{
  String nome;
  Set<int> _quartos = {};

  Cliente(this.nome);

  void adicionarQuarto(int quarto){
    try{
      this._quartos.add(quarto);
      print("Quarto inserido com sucesso");
      print('');
      this.listarReservas();
    } catch(e){
      print(e);
      print("Falha ao inserir um quarto");
      print('');
    }
  }

  void listarReservas(){
    if (this._quartos.isNotEmpty){
      print("O usuário ${this.nome} tem os seguintes quartos reservados");
      this._quartos.forEach((e) => print("* $e"));
    } else {
      print("${this.nome} não possui quartos reservados");
    }
    print("");
  }

  /*
  Implemente uma função dentro da classe Cliente que permita ao cliente cancelar uma reserva existente. A função deve remover o quarto da lista de reservas do cliente, desde que ele tenha uma reserva ativa para aquele quarto, e exibir a lista atualizada de reservas. Garanta que a função só permita o cancelamento se o cliente tiver realmente uma reserva para aquele quarto.
  */

  void cancelarReserva(int quarto){
    try {
      if (this._quartos.contains(quarto)){
        this._quartos.remove(quarto);
        print("Quarto $quarto foi removido da lista de quartos reservados de ${this.nome}");
        print("");
        this.listarReservas();
        print("");
      } else {
        print("${this.nome} não possui o quarto $quarto");
        print("");
      }
    } catch(e){
      print(e);
      print("Erro ao cancelar reserva");
    }
  }

}