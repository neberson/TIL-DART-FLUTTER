import 'package:meu_app_orientacao_objetos/classes/pessoa_abstract.dart';
import 'package:meu_app_orientacao_objetos/enum/tipoNotificacao.dart';
import 'package:meu_app_orientacao_objetos/service/NotificacaoInterface.dart';
import 'package:meu_app_orientacao_objetos/service/impl/NotificacaoEmail.dart';
import 'package:meu_app_orientacao_objetos/service/impl/NotificacaoPushNotification.dart';
import 'package:meu_app_orientacao_objetos/service/impl/NotificacaoSMS.dart';

class EnviarNotificacao {
  NotificacaoInterface? notificacao;

  void notificar(Pessoa pessoa) {
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.EMAIL:
        notificacao = NotificacaoEmail();
        break;
      case TipoNotificacao.PUSH_NOTIFICATION:
        notificacao = NotificacaoPushNotification();
        break;
      case TipoNotificacao.SMS:
        notificacao = NotificacaoSMS();
        break;
      default:
        break;
    }
    if (notificacao != null) {
      notificacao!.EnviarNotificacao(pessoa);
    } else {
      print("Pessoa sem tipo de notificação!");
    }
  }
}
