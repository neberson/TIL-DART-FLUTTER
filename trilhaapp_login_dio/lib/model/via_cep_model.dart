class ViaCepModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  ViaCepModel(
      {String? cep,
      String? logradouro,
      String? complemento,
      String? bairro,
      String? localidade,
      String? uf,
      String? ibge,
      String? gia,
      String? ddd,
      String? siafi}) {
    if (cep != null) {
      cep = cep;
    }
    if (logradouro != null) {
      logradouro = logradouro;
    }
    if (complemento != null) {
      complemento = complemento;
    }
    if (bairro != null) {
      bairro = bairro;
    }
    if (localidade != null) {
      localidade = localidade;
    }
    if (uf != null) {
      uf = uf;
    }
    if (ibge != null) {
      ibge = ibge;
    }
    if (gia != null) {
      gia = gia;
    }
    if (ddd != null) {
      ddd = ddd;
    }
    if (siafi != null) {
      siafi = siafi;
    }
  }

  ViaCepModel.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    return data;
  }
}
