import 'package:hive/hive.dart';
import 'package:trilhaapp/model/configuracoes_model.dart';

class ConfiguracoesRepository {
  static late Box _box;
  static Future<ConfiguracoesRepository> carregar() async {
    if (Hive.isBoxOpen('configuracoes')) {
      _box = Hive.box('configuracoes');
    } else {
      _box = await Hive.openBox('configuracoes');
    }
    return ConfiguracoesRepository._criar();
  }

  ConfiguracoesRepository._criar() {}

  void salvar(ConfiguracoesModel configuracao) {
    _box.put('configuracoesModel', {
      'nomeUsuario': configuracao.nomeUsuario,
      'altura': configuracao.altura,
      'receberNotificacoes': configuracao.receberNotificacoes,
      'temaEscuro': configuracao.temaEscuro
    });
  }

  ConfiguracoesModel obterDados() {
    var configuracoes = _box.get('configuracoesModel');

    if (configuracoes == null) {
      return ConfiguracoesModel.vazio();
    }

    return ConfiguracoesModel(
        configuracoes['nomeUsuario'],
        configuracoes['altura'],
        configuracoes['receberNotificacoes'],
        configuracoes['temaEscuro']);
  }
}
