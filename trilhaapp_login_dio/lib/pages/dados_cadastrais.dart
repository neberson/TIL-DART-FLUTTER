import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagem_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/service/app_storage.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController();
  var dataNascimentoController = TextEditingController();
  DateTime? dataNascimento;
  var niveis = [];
  var nivelSelecionado = "";
  var linguagens = [];
  List<String> linhagensSelecionadas = [];
  double pretensaoSalario = 1000;
  int tempoExperiencia = 1;

  late AppStorageService storage;

  bool salvando = false;

  @override
  void initState() {
    niveis = NivelRepository.retornaNiveis();
    linguagens = LinguagensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = AppStorageService();
    nomeController.text = await storage.getDadosCadastraisNome();
    dataNascimentoController.text = await storage.getDadosDataNascimento();
    if (dataNascimentoController.text.isNotEmpty) {
      dataNascimento = DateTime.tryParse(dataNascimentoController.text);
    }

    nivelSelecionado = await storage.getDadosNivelExperiencia();
    linhagensSelecionadas = await storage.getDadosLinguagensPreferidas();
    tempoExperiencia = await storage.getDadosTempoExperiencia();
    pretensaoSalario = await storage.getDadosPretensaoSalarial();
    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItens(int quantidade) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= quantidade; i++) {
      itens.add(DropdownMenuItem(value: i, child: Text(i.toString())));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meus dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const TextLabel(texto: "Nome"),
                    TextField(
                      controller: nomeController,
                    ),
                    const TextLabel(texto: "Data de Nascimento"),
                    TextField(
                      controller: dataNascimentoController,
                      readOnly: true,
                      onTap: () async {
                        var data = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900, 1, 1),
                            lastDate: DateTime(2099, 1, 1));
                        if (data != null) {
                          dataNascimentoController.text = data.toString();
                          dataNascimento = data;
                        }
                      },
                    ),
                    const TextLabel(texto: "Nivel de experiência"),
                    Column(
                      children: niveis
                          .map((nivel) => RadioListTile(
                              dense: true,
                              selected: nivelSelecionado == nivel,
                              title: Text(nivel.toString()),
                              value: nivel.toString(),
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                setState(() {
                                  nivelSelecionado = value.toString();
                                });
                              }))
                          .toList(),
                    ),
                    const TextLabel(texto: "Linguagens preferidas"),
                    Column(
                      children: linguagens
                          .map((linguagem) => CheckboxListTile(
                              dense: true,
                              title: Text(linguagem),
                              value: linhagensSelecionadas.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linhagensSelecionadas.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linhagensSelecionadas.remove(linguagem);
                                  });
                                }
                              }))
                          .toList(),
                    ),
                    const TextLabel(texto: "Tempo de experiência"),
                    DropdownButton(
                        isExpanded: true,
                        value: tempoExperiencia,
                        items: returnItens(50),
                        onChanged: (value) {
                          setState(() {
                            tempoExperiencia = int.parse(value.toString());
                          });
                        }),
                    TextLabel(
                        texto:
                            "Pretensão salarial. R\$ ${pretensaoSalario.round().toString()}"),
                    Slider(
                        value: pretensaoSalario,
                        min: 1000,
                        max: 10000,
                        divisions: 9,
                        label: pretensaoSalario.toStringAsFixed(0),
                        onChanged: (value) {
                          setState(() {
                            pretensaoSalario = value;
                          });
                        }),
                    TextButton(
                      child: const Text("Salvar"),
                      onPressed: () async {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text(
                                  "O nome digitado é inválido ou está vázio!")));
                          return;
                        }
                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content:
                                      Text("Data de nascimento inválida!")));
                          return;
                        }
                        if (nivelSelecionado.trim() == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content:
                                      Text("O nível deve ser selecionado!")));
                          return;
                        }
                        if (linhagensSelecionadas.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text(
                                      "Selecione pelo menos uma linguagem!")));
                          return;
                        }
                        if (tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                  "Deve ter ao menos 1 ano de experiência em uma das linguagens!")));
                          return;
                        }

                        await storage
                            .setDadosCadastraisNome(nomeController.text);
                        await storage.setDadosCadastraisDataNascimento(
                            dataNascimento.toString());
                        await storage.setDadosCadastraisNivelExperiencia(
                            nivelSelecionado);
                        await storage.setDadosCadastraisLinguagensPreferidas(
                            linhagensSelecionadas);
                        await storage.setDadosCadastraisTempoExperiencia(
                            tempoExperiencia);
                        await storage.setDadosCadastraisPretensaoSalarial(
                            pretensaoSalario);
                        setState(() {
                          salvando = true;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            salvando = false;
                          });
                        });
                      },
                    )
                  ],
                ),
        ));
  }
}
