abstract class Ingrediente{
  String nome;
  String tipo;

  Ingrediente(this.nome,this.tipo);

  void detalhes();
}

// Ao criar as três classes, aplique a herança e polimorfismo. Sobrescreva o método detalhes() em cada uma das classes. Por exemplo, em Fruta, você pode inserir um print “em geral, são vegetais que não podem ser cozidos nas receitas” e assim por diante.

class Fruta extends Ingrediente{
  Fruta(super.nome,super.tipo);

  @override
  void detalhes(){
    print("Nome: $nome");
    print("Tipo: $tipo");
    print("Detalhes: As frutas geralmente não são cozidas nas receitas.");
  }
}

class Legume extends Ingrediente{
  Legume(super.nome,super.tipo);

  @override
  void detalhes(){
    print("Nome: $nome");
    print("Tipo: $tipo");
    print("Detalhes: Os legumes geralmente precisam ser cozidos nas receitas.");
  }
}

class Tempero extends Ingrediente{
  Tempero(super.nome,super.tipo);

  @override
  void detalhes(){
    print("Nome: $nome");
    print("Tipo: $tipo");
    print("Detalhes: Os temperos são usados para condimentar os alimentos.");
  }
}