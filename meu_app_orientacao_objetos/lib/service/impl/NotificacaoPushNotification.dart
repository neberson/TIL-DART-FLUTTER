import 'package:meu_app_orientacao_objetos/classes/pessoa_abstract.dart';
import 'package:meu_app_orientacao_objetos/service/NotificacaoInterface.dart';

class NotificacaoPushNotification implements NotificacaoInterface {
  @override
  void EnviarNotificacao(Pessoa pessoa) {
    print("Enviando Push Notification para: ${pessoa.getNome()}");
  }
}
