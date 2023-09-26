import 'dart:math';

class GeradorNumeroAleatorioService {
  static int gerarNumeroAleatorio(int numeroMaximo) {
    Random numeroGerado = Random();
    return numeroGerado.nextInt(numeroMaximo);
  }
}
