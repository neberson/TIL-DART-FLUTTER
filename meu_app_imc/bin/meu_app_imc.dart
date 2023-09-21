import 'package:meu_app_imc/models/pessoa.dart';
import 'dart:io';

void main(List<String> arguments) {
  try {
    stdout.write("Digite o nome: ");
    String nome = stdin.readLineSync() ?? "";

    stdout.write("Digite o peso (em kg): ");
    double peso = double.parse(stdin.readLineSync() ?? "0");

    stdout.write("Digite a altura (em metros): ");
    double altura = double.parse(stdin.readLineSync() ?? "0");

    Pessoa pessoa = Pessoa(nome, peso, altura);

    print("Nome: ${pessoa.nome}");
    print("Peso: ${pessoa.peso} kg");
    print("Altura: ${pessoa.altura} m");

    double imc = pessoa.calcularIMC();
    String statusIMC = pessoa.calcularStatusIMC();

    print("IMC: $imc");
    print("Status IMC: $statusIMC");
  } catch (e) {
    print("Erro: $e");
  }
}
