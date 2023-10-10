class TarefaSQLiteModel {
  int _id = 0;
  String _descricao = '';
  bool _concluido = false;

  TarefaSQLiteModel(this._id, this._descricao, this._concluido);

  bool get concluido => _concluido;

  set concluido(bool value) => _concluido = value;

  String get descricao => _descricao;

  set descricao(String value) => _descricao = value;

  int get id => _id;
}
