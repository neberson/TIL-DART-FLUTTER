class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _receberNotificacoes = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio() {
    _nomeUsuario = "";
    _altura = 0;
    _receberNotificacoes = false;
    _temaEscuro = false;
  }
  ConfiguracoesModel(this._nomeUsuario, this._altura, this._receberNotificacoes,
      this._temaEscuro);

  set nomeUsuario(String nome) => _nomeUsuario = nome;
  set altura(double altura) => _altura = altura;
  set receberNotificacoes(bool receberNotificacoes) =>
      _receberNotificacoes = receberNotificacoes;
  set temaEscuro(bool temaEscuro) => _temaEscuro = temaEscuro;

  String get nomeUsuario => _nomeUsuario;
  double get altura => _altura;
  bool get receberNotificacoes => _receberNotificacoes;
  bool get temaEscuro => _temaEscuro;
}
