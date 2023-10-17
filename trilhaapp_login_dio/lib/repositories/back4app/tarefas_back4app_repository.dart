import 'package:trilhaapp/model/tarefas_back4app_model.dart';
import 'package:trilhaapp/repositories/back4app/back4app_custom_dio.dart';

class TarefasBack4AppRepository {
  final _dio = Back4AppCustomDio();

  TarefasBack4AppRepository();

  Future<TarefasBack4AppModel> obterTarefas(bool naoConcluidas) async {
    var url = '/Tarefas';

    if (naoConcluidas) {
      url = '$url?where={"concluido": false}';
    }

    var result = await _dio.dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _dio.dio.post('/Tarefas', data: tarefaBack4AppModel.toCreateJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _dio.dio.put('/Tarefas/${tarefaBack4AppModel.objectId}',
          data: tarefaBack4AppModel.toCreateJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> deletar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _dio.dio.delete('/Tarefas/${tarefaBack4AppModel.objectId}');
    } catch (e) {
      throw e;
    }
  }
}
