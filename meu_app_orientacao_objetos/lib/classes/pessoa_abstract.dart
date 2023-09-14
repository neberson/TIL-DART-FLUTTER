import 'package:meu_app_orientacao_objetos/enum/tipoNotificacao.dart';

abstract class Pessoa {
  String _nome = "";
  String _endereco = "";
  String _email = "";
  String _celular = "";
  String _token = "";
  TipoNotificacao _tipoNotificacao = TipoNotificacao.NENHUM;

  Pessoa(String nome, String endereco, TipoNotificacao tipoNotificacao) {
    _nome = nome;
    _endereco = endereco;
    _tipoNotificacao = tipoNotificacao;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  void setEndereco(String endereco) {
    _endereco = endereco;
  }

  void setTipoNotificacao(TipoNotificacao tipoNotificacao) {
    _tipoNotificacao = tipoNotificacao;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setCelular(String celular) {
    _celular = celular;
  }

  void setToken(String token) {
    _token = token;
  }

  String getNome() {
    return _nome;
  }

  String getEndereco() {
    return _endereco;
  }

  TipoNotificacao getTipoNotificacao() {
    return _tipoNotificacao;
  }

  String getEmail() {
    return _email;
  }

  String getCelular() {
    return _celular;
  }

  String getToken() {
    return _token;
  }

  @override
  String toString() {
    return {
      "Nome": _nome,
      "Endereco": _endereco,
      "TipoNotificacao": _tipoNotificacao
    }.toString();
  }
}
