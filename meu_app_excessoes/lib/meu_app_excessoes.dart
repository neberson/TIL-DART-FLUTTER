import 'dart:io';

import 'package:meu_app_excessoes/exception/nome_invalido_exception.dart';
import 'package:meu_app_excessoes/models/aluno_model.dart';
import 'package:meu_app_excessoes/models/console_utils.dart';

void execute() {
  print("Bem vindo ao sistema de notas");
  String nome = ConsoleUtils.lerStringComTexto("Digie o nome do Aluno");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  var aluno = Aluno(nome);
  double? nota;
  do {
    nota = ConsoleUtils.lerDouleComTextoComSaida(
        "Digite a nota ou S para sair", "S");
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);

  print("As notas digitadas foram: ${aluno.getNotas()}");
  print("A média do aluno foi: ${aluno.retornaMedia()}");

  if (aluno.aprovado(7)) {
    print("O aluno ${aluno.getNome()} foi aprovado!");
  } else {
    print("O aluno ${aluno.getNome()} foi reprovado!");
  }
}
