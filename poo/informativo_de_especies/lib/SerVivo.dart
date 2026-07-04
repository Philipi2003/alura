// Crie um programa que mostra características sobre os seres vivos e implemente três classes, seguindo os requisitos de cada uma:
// Classe SerVivo: será uma classe abstrata que terá um método void mostrarCaracteristicas();.
abstract class SerVivo {
  mostrarCaracteristicas();
}
// Planta: será uma classe que implementa SerVivo e terá os seguintes objetos e suas descrições de print:
// Girassol: é uma planta, não tem os cinco sentidos, é uma flor;
// Laranjeira: é uma planta, não tem os cinco sentidos, é uma árvore;
class Planta implements SerVivo{
  String nome;
  String caracteristicas;

  Planta(this.nome,this.caracteristicas);

  @override
  mostrarCaracteristicas() {
    // TODO: implement mostrarCaracteristicas
    print("$nome: $caracteristicas");
  }
}
// Animal: é vivo e tem os cinco sentidos:
// Ser humano: tem cinco sentidos, pensa e fala, é bípede e vive em média 75 anos;
// Gato: tem cinco sentidos, mia, é quadrúpede e vive em média 20 anos;
// Cão: tem cinco sentidos, late, é quadrúpede e vive em média 20 anos.
class Animal implements SerVivo{
  String nome;
  String caracteristicas;

  Animal(this.nome,this.caracteristicas);

  @override
  mostrarCaracteristicas() {
    // TODO: implement mostrarCaracteristicas
    print("$nome: $caracteristicas");
  }
}