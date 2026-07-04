import 'package:informativo_de_especies/SerVivo.dart';
import 'package:informativo_de_especies/informativo_de_especies.dart' as informativo_de_especies;

void main(List<String> arguments) {
  Planta girassol = Planta("Girassol", "é uma planta, não tem os cinco sentidos, é uma flor");
  Planta laranjeira = Planta("Laranjeira", "é uma planta, não tem os cinco sentidos, é uma árvore");
  Animal serHumano = Animal("Ser humano", "tem cinco sentidos, pensa e fala, é bípede e vive em média 75 anos");
  Animal gato = Animal("Gato", "tem cinco sentidos, mia, é quadrúpede e vive em média 20 anos");
  Animal cao = Animal("Cão", "tem cinco sentidos, late, é quadrúpede e vive em média 20 anos");

  girassol.mostrarCaracteristicas();
  laranjeira.mostrarCaracteristicas();
  serHumano.mostrarCaracteristicas();
  gato.mostrarCaracteristicas();
  cao.mostrarCaracteristicas();
}
