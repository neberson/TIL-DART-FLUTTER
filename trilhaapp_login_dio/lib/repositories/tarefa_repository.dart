import '../model/tarefa.dart';

class TarefaRepository {
  List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(microseconds: 0));
    _tarefas.firstWhere((tarefa) => tarefa.id == id).concluido = concluido;
  }

  Future<void> excluirTarefa(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.removeWhere((tarefa) => tarefa.id == id);
  }

  Future<List<Tarefa>> listarTarefas() async {
    await Future.delayed(const Duration(seconds: 0));
    return _tarefas;
  }

  Future<List<Tarefa>> listarNaoConcluidas() async {
    await Future.delayed(const Duration(seconds: 0));
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }
}
