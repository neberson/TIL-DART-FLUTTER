import 'package:meu_app_orientacao_objetos/enum/tipoNotificacao.dart';
import 'package:meu_app_orientacao_objetos/classes/pessoa_abstract.dart';

class PessoaJuridica extends Pessoa {
  String _cnpj = "";

  PessoaJuridica(String nome, String endereco, String cnpj,
      TipoNotificacao tipoNotificacao)
      : super(nome, endereco, tipoNotificacao) {
    _cnpj = cnpj;
  }

  void setCNPJ(String cnpj) {
    _cnpj = cnpj;
  }

  String getCNPJ() {
    return _cnpj;
  }

  @override
  String toString() {
    return {
      "Nome": getNome(),
      "Endereco": getEndereco(),
      "CNPJ": _cnpj,
      "TipoNotificacao": getTipoNotificacao()
    }.toString();
  }
}
