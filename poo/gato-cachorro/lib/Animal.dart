/*
Além disso, adicione métodos específicos para cada classe, como abanarRabo() para o Cachorro e arranharMoveis() para o Gato.
*/

abstract class Animal{
  void emitirSom(){
    print("Som genérico");
  }
}

class Cachorro extends Animal{
  @override
  void emitirSom(){
    print("O cachorro late");
  }
  void abanarRabo(){
    print("O cachorro está abanando o rabo");
  }
}

class Gato extends Animal{
  @override
  void emitirSom(){
    print("o gato miou");
  }

  void arranharMoveis(){
    print("O gato está arranhando os móveis");
  }
}