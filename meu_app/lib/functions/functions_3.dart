import 'package:meu_app/functions/utils.dart' as utils;

void main(List<String> arguments) {
  var line = utils.LerConsole("Digite um número ou 'S' para sair");
  double acumulador = 0;
  while (line != "S") {
    var numero = double.parse(line);
    acumulador = utils.soma(acumulador, numero);
    line = utils.LerConsole("Digite um número ou 'S' para sair");
  }
  print(acumulador);
}
