import 'package:meu_app_orientacao_objetos/enum/tipoNotificacao.dart';
import 'package:meu_app_orientacao_objetos/classes/pessoa_abstract.dart';

class PessoaFisica extends Pessoa {
  String _cpf = "";

  PessoaFisica(
      String nome, String endereco, String cpf, TipoNotificacao tipoNotificacao)
      : super(nome, endereco, tipoNotificacao) {
    _cpf = cpf;
  }

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  String getCpf() {
    return _cpf;
  }

  @override
  String toString() {
    return {
      "Nome": getNome(),
      "Endereco": getEndereco(),
      "CPF": _cpf,
      "TipoNotificacao": getTipoNotificacao()
    }.toString();
  }
}
