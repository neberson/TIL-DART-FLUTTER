import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tarefas_back4app_model.dart';
import 'package:trilhaapp/repositories/back4app/tarefas_back4app_repository.dart';

class TarefaHttpPage extends StatefulWidget {
  const TarefaHttpPage({super.key});

  @override
  State<TarefaHttpPage> createState() => _TarefaHttpPageState();
}

class _TarefaHttpPageState extends State<TarefaHttpPage> {
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();
  var _tarefasBack4App = TarefasBack4AppModel();
  bool _filtraNaoConcuidas = false;
  TextEditingController descricaoController = TextEditingController();
  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {
      carregando = true;
    });
    _tarefasBack4App = await tarefaRepository.obterTarefas(_filtraNaoConcuidas);
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas HTTP'),
      ),
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
                          await tarefaRepository.criar(
                              TarefaBack4AppModel.criar(
                                  descricaoController.text, false));
                          Navigator.pop(context);
                          obterTarefas();
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
            carregando
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                        itemCount: _tarefasBack4App.tarefas.length,
                        itemBuilder: (BuildContext bc, int index) {
                          var tarefa = _tarefasBack4App.tarefas[index];
                          return Dismissible(
                            key: Key(tarefa.descricao),
                            onDismissed: (dismissDirection) async {
                              setState(() {
                                carregando = true;
                              });
                              await tarefaRepository.deletar(tarefa);
                              obterTarefas();
                            },
                            child: ListTile(
                              title: Text(tarefa.descricao),
                              trailing: Switch(
                                  value: tarefa.concluido,
                                  onChanged: (value) async {
                                    tarefa.concluido = value;
                                    await tarefaRepository.atualizar(tarefa);
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
