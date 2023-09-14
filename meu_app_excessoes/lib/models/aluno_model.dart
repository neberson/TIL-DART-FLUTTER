class Aluno {
  String _nome = "";
  final List<double> _notas = [];

  Aluno(this._nome);

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void adicionarNota(double nota) {
    _notas.add(nota);
  }

  List<double> getNotas() {
    return _notas;
  }

  double retornaMedia() {
    var media =
        _notas.reduce((value, element) => value + element) / _notas.length;
    return media.isNaN ? 0 : media;
  }

  bool aprovado(double notaCorte) {
    return retornaMedia() >= notaCorte;
  }
}
