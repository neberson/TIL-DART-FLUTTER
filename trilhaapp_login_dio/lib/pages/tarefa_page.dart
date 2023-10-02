import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/tarefa_repository.dart';

import '../model/tarefa.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = TarefaRepository();
  var _tarefas = const <Tarefa>[];
  bool _filtraNaoConcuidas = false;
  TextEditingController descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepository.listarTarefas();
    _filtraNaoConcuidas
        ? _tarefas = await tarefaRepository.listarNaoConcluidas()
        : _tarefas = await tarefaRepository.listarTarefas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Adicionar tarefa"),
                  content: TextField(
                    controller: descricaoController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancelar",
                        )),
                    TextButton(
                        onPressed: () async {
                          await tarefaRepository.adicionar(
                              Tarefa(descricaoController.text, false));
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: const Text("Salvar"))
                  ],
                );
              });
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluídas!",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                      value: _filtraNaoConcuidas,
                      onChanged: (value) {
                        _filtraNaoConcuidas = value;
                        setState(() {
                          obterTarefas();
                        });
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.id),
                      onDismissed: (dismissDirection) async {
                        await tarefaRepository.excluirTarefa(tarefa.id);
                        obterTarefas();
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                            value: tarefa.concluido,
                            onChanged: (value) async {
                              await tarefaRepository.alterar(
                                  tarefa.id, !tarefa.concluido);
                              obterTarefas();
                            }),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
