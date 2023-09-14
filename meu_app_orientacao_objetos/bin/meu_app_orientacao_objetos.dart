import 'package:meu_app_orientacao_objetos/enum/tipoNotificacao.dart';
import 'package:meu_app_orientacao_objetos/classes/pessoaFisica.dart';
import 'package:meu_app_orientacao_objetos/classes/pessoaJuridica.dart';
import 'package:meu_app_orientacao_objetos/service/EnviarNotificacao.dart';

void main(List<String> arguments) {
  var pessoaFisica1 = PessoaFisica(
      "Neberson", "Rua 1", "111.111.111-00", TipoNotificacao.PUSH_NOTIFICATION);
  print(pessoaFisica1);

  var pessoaJuridica1 = PessoaJuridica(
      "Empresa 1", "Rua 2", "11.111.111/0000-11", TipoNotificacao.EMAIL);

  print(pessoaJuridica1);

  EnviarNotificacao enviarNotificacao = EnviarNotificacao();

  enviarNotificacao.notificar(pessoaJuridica1);
  enviarNotificacao.notificar(pessoaFisica1);
}
