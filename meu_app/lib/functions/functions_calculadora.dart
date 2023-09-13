import 'dart:io';
import 'package:meu_app/functions/utils.dart' as utils;

void main(List<String> arguments) {
  print("Bem vindos a nossa calculadora!");

  var numero1 = double.parse(utils.LerConsole("Informe o primeiro número:"));

  var numero2 = double.parse(utils.LerConsole("Informe o segundo número:"));

  var operacao =
      utils.LerConsole("Informe a operação matemática (+, -, *, /):");

  calcular(operacao, numero1, numero2);
}

void calcular(String operacao, double numero1, double numero2) {
  double resultado = 0;
  switch (operacao) {
    case "+":
      resultado = utils.soma(numero1, numero2);
      break;
    case "-":
      resultado = utils.subtracao(numero1, numero2);
      break;
    case "*":
      resultado = utils.multiplicacao(numero1, numero2);
      break;
    case "/":
      resultado = utils.divisao(numero1, numero2);
      break;
    default:
      print("Operação inválida!");
      exit(0);
  }
  print("Operação solicitada: $operacao");
  print("O resultado da operação é: $resultado");
}
