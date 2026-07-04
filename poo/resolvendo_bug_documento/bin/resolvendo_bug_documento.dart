abstract class Documento {
  String nomeDoDocumento;

  Documento(this.nomeDoDocumento);

  void imprimir() {
    print('O $nomeDoDocumento foi enviado para impressão');
  }
}

class Relatorio extends Documento {
  Relatorio(super.nomeDoDocumento);
}

void main() {
  Relatorio relatorio = Relatorio('Relatório Anual');
  relatorio.imprimir();
}