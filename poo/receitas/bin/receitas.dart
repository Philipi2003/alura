import 'package:receitas/Ingrediente.dart';
import 'package:receitas/receitas.dart' as receitas;

void main(List<String> arguments) {
  Fruta maca = Fruta("Maçã", "Fruta");
  Legume batata = Legume("Batata", "Tubéculo");
  Tempero sazon = Tempero("Sazon", "Tempero industrializado");

  print("");
  maca.detalhes();
  print("");
  batata.detalhes();
  print("");
  sazon.detalhes();
  print("");
}
