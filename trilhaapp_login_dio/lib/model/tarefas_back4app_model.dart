class TarefasBack4AppModel {
  List<TarefaBack4AppModel> tarefas = [];

  TarefasBack4AppModel();

  TarefasBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <TarefaBack4AppModel>[];
      json['results'].forEach((v) {
        tarefas.add(TarefaBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = tarefas.map((v) => v.toJson()).toList();
    return data;
  }
}

class TarefaBack4AppModel {
  String objectId = "";
  String createdAt = "";
  String updatedAt = "";
  String descricao = "";
  bool concluido = false;

  TarefaBack4AppModel(this.objectId, this.createdAt, this.updatedAt,
      this.descricao, this.concluido);

  TarefaBack4AppModel.criar(this.descricao, this.concluido);

  TarefaBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    descricao = json['descricao'];
    concluido = json['concluido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    return data;
  }
}
