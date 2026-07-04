class Receita{
    String nome;
    double preco;

    Receita({required this.nome, required this.preco});

    @override
  String toString() {
    // TODO: implement toString
    return "${this.nome}: R\$ ${this.preco.toStringAsFixed(2)}";
  }
}