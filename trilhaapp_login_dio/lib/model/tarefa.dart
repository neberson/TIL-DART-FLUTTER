import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool   _concluido = false;

  Tarefa( this._descricao, this._concluido);

  bool get concluido => _concluido;

  set concluido(bool value) => _concluido = value;

  String get descricao => _descricao;

  set descricao(String value) => _descricao = value;

  String get id => _id;

}