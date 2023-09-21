import 'package:meu_app_imc/models/pessoa.dart';
import 'package:test/test.dart';

void main() {
  group('Pessoa', () {
    test('Deve criar uma pessoa válida', () {
      expect(
        () => Pessoa("João", 70, 1.75),
        returnsNormally,
      );
    });

    test('Deve lançar exceção para nome vazio', () {
      expect(
        () => Pessoa("", 70, 1.75),
        throwsA(isA<Exception>()),
      );
    });

    test('Deve lançar exceção para peso menor ou igual a zero', () {
      expect(
        () => Pessoa("Maria", 0, 1.65),
        throwsA(isA<Exception>()),
      );
    });

    test('Deve lançar exceção para altura menor ou igual a zero', () {
      expect(
        () => Pessoa("José", 80, 0),
        throwsA(isA<Exception>()),
      );
    });

    test('Deve calcular o IMC corretamente', () {
      final pessoa = Pessoa("Ana", 60, 1.70);
      expect(pessoa.calcularIMC(), closeTo(20.76, 0.01));
    });

    test('Deve retornar o status do IMC corretamente', () {
      final pessoa1 = Pessoa("Pedro", 70, 1.75);
      expect(pessoa1.calcularStatusIMC(), equals("Peso normal"));

      final pessoa2 = Pessoa("Carlos", 90, 1.70);
      expect(pessoa2.calcularStatusIMC(), equals("Obesidade grau 1"));
    });
  });
}
